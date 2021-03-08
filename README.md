# Airfoil-Plotter

The first iteration of a tool to create plots and initial CAD model of aircraft wing during iteration for AERO McGill (created October 2018).

## Background

Automating the CAD process was driven by a need for a time and labor efficient design process as iterative design is required for optimization. For AERO specifically, many aircraft parameters can generally only be attained via computational analysis after certain design decisions are made. The results from this process can then be used to alter aspects of design, to ensure the aircraft fits within design constraints, or to improve function. 

Complex systems comprise of subsystems or subcomponents have dependencies or interdependencies with one another. In the interest of time, the design of these various components or systems should occur simultaneously. For our aircraft, one of the most critical aspects of design is the shape of the aircraft: this affects stability, control surfaces, payload and internal space management, structures, etc. Redesign of the aircraft shape is inevitable, due to problems encountered in subsystem design, such as needing to internalize payload to reduce drag, or due to results from more intensive aerodynamic analysis. Thus, it was imperative to automate the CAD process for quick and effortless generation of aircraft geometry, to prevent bottlenecks in aircraft development.

The tool is split in two: a MATLAB script reads user inputs of airfoil type, size, position, and orientation for predefined ‘critical’ cross-sections, and outputs the geometric shape of the airfoil in a format readable by SolidWorks. This output is then read into the SolidWorks API, which generates the CAD model, lofting between airfoil cross-sections, defined by a combination of linear and user-defined splines. Note that this code is written in Visual Basic, to ensure compatibility with the default user’s SolidWorks program – C++ was originally used, but lacks compatibility as the interpreter must be selected for installation during the SolidWorks installation process, a step that many disregard.

Future developments seek to expand the utility of the code to generate other aircraft components, and increase the number of generated features. As well, integration of the function provided by the MATLAB script into the SolidWorks API to further increase ease of access is planned.

## Use

These scripts can be used by copying the desired airfoil data into the airfoilPos.m file. The script has the e423 airfoil loaded in by default. Running airfoilPos.m generates a text file and solidwork curve files (.sldcrv) that is used by the solidworks macro (airfoilPlotter.swp) to generate a 3D CAD of the airfoil. Examples of outputs are included in the sample output folder.
