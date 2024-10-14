within Tutorial2024.StepByStep;
model Step8_ElectricCraneCrab "Electrically Actuated Crane Crab"
    extends Modelica.Icons.Example;

  inner PlanarMechanics.PlanarWorld planarWorld
    annotation (Placement(transformation(extent={{-80,-80},{-60,-60}})));
  PlanarMechanics.Parts.Body carriage(m=1, I=0.001)
    annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
  PlanarMechanics.Parts.Fixed fixed annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-60,-20})));
  PlanarMechanics.Parts.Body pendulum(m=0.5, I=0.001)
    annotation (Placement(transformation(extent={{40,-80},{60,-60}})));
  PlanarMechanics.Parts.FixedTranslation rod(r={0.5,0})
    annotation (Placement(transformation(extent={{10,-80},{30,-60}})));
  PlanarMechanics.Joints.Revolute revolute1
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-50})));
  PlanarMechanics.Joints.Prismatic prismatic(useFlange=true, r={1,0})
    annotation (Placement(transformation(extent={{-20,-10},{0,-30}})));
  Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_PermanentMagnet dcpm(
    Jr=0,
    VaNominal=12,
    useThermalPort=false,
    Ra=0.05,
    alpha20a(displayUnit="1/K") = 0,
    La=0.0015,
    useSupport=false,
    Js=0,
    TaOperational=293.15,
    IaNominal=1,
    wNominal(displayUnit="rad/s") = 100,
    TaNominal=293.15,
    TaRef=293.15)
    annotation (Placement(transformation(extent={{-60,10},{-40,30}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-88,10},{-68,30}})));
  Modelica.Mechanics.Translational.Components.IdealGearR2T idealGearR2T(ratio=100)
    annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
  Modelica.Electrical.Analog.Sources.ConstantCurrent constantCurrent(I=0.2)
    annotation (Placement(transformation(extent={{-70,40},{-50,60}})));
equation
  connect(rod.frame_b, pendulum.frame_a) annotation (Line(
      points={{30,-70},{40,-70}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute1.frame_b, rod.frame_a) annotation (Line(
      points={{0,-60},{0,-70},{10,-70}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute1.frame_a, carriage.frame_a) annotation (Line(
      points={{0,-40},{0,-20},{20,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(fixed.frame, prismatic.frame_a) annotation (Line(
      points={{-50,-20},{-20,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(prismatic.frame_b, carriage.frame_a) annotation (Line(
      points={{0,-20},{20,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(ground.p, dcpm.pin_an)
    annotation (Line(points={{-78,30},{-56,30}}, color={0,0,255}));
  connect(revolute1.frame_a, prismatic.frame_b) annotation (Line(
      points={{0,-40},{0,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(ground.p, constantCurrent.p) annotation (Line(points={{-78,30},{-80,
          30},{-80,50},{-70,50}},
                              color={0,0,255}));
  connect(constantCurrent.n, dcpm.pin_ap)
    annotation (Line(points={{-50,50},{-44,50},{-44,30}}, color={0,0,255}));
  connect(dcpm.flange, idealGearR2T.flangeR)
    annotation (Line(points={{-40,20},{-40,20}}, color={0,0,0}));
  connect(idealGearR2T.flangeT, prismatic.flange_a) annotation (Line(points={{-20,20},
          {-10,20},{-10,-10}},         color={0,127,0}));
  annotation (experiment(
      StopTime=5,
      __Dymola_NumberOfIntervals=1500,
      __Dymola_Algorithm="Dassl"));
end Step8_ElectricCraneCrab;
