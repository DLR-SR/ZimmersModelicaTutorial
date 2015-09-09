within Tutorial2015.BaseComponents.SimplePlanarMechanics.Parts;
model Fixed "FixedPosition"
  Interfaces.Frame_a frame_a
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}}),
        iconTransformation(extent={{-120,-20},{-80,20}})));
  parameter SI.Position r[2] = {0,0} "fixed x,y-position";
  parameter SI.Angle phi = 0 "fixed angle";
equation
  {frame_a.x,frame_a.y} = r;
  frame_a.phi = phi;
  annotation (Icon(graphics={
        Text(
          extent={{-100,-80},{100,-120}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={85,170,255},
          textString="%name"),
        Line(
          points={{-92,0},{0,0}}),
        Line(
          points={{0,80},{0,-80}}),
        Line(
          points={{0,40},{80,0}}),
        Line(
          points={{0,80},{80,40}}),
        Line(
          points={{0,0},{80,-40}}),
        Line(
          points={{0,-40},{80,-80}})}),            Documentation(revisions="<html>
<p>Main author: Dr. Dirk Zimmer, Deutsches Zentrum f&uuml;r Luft- und Raumfahrt (DLR), Institute of System Dynamics and Control, 2015</p>
<p>Terms of usage: Usage of this library and its components is granted for non-commercial and educational purposes to everyone</p>
</html>",
   info="<html>
<p>This component defines the x, y-position and angle of the frame connectors, to which this component is attached to.</p>
</html>"));
end Fixed;
