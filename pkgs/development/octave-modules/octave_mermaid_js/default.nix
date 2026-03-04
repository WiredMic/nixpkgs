{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  python,
  # python3-pillow      python3-matplotlib      python3-requests
}:
let
  pythonEnv = python.withPackages (
    ps: with ps; [
      pillow
      matplotlib
      requests
    ]
  );
in
buildOctavePackage rec {
  pname = "octave_mermaid_js";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "CNOCTAVE";
    repo = "octave_mermaid_js";
    tag = version;
    sha256 = "sha256-9gnnYPVzF6yOVljQaJYZQzoAOv+SY2HcO99FtXObQuE=";
  };

  propagatedBuildInputs = [ pythonEnv ];

  meta = {
    homepage = "https://gnu-octave.github.io/packages/octave_mermaid_js/";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ KarlJoad ];
    description = "The octave_mermaid_js package is used to generate, show and save a diagram from a Mermaid graph description string.";
    longDescription = ''
      The octave_mermaid_js package is used to generate,
      show and save a diagram from a Mermaid graph description string.
      You can use octave_mermaid_js to create flowcharts, sequence diagrams,
      class diagrams, state diagrams, ER diagram, user journey diagrams, Gantt charts,
      pie charts, quadrant charts, requirement diagrams, Git Graphs, C4 Diagrams, Mindmaps,
      timelines, ZenUML, Sankey diagrams, XY Charts, Block Diagrams, packet diagrams,
      Mermaid’s Kanban diagrams, architecture diagrams, radar diagrams and treemap diagrams.
    '';
  };
}
