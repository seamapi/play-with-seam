#!/bin/bash
set -ex

# This runs inside the container
dotnet new console
dotnet add package seam

rm Program.cs
mv sample.cs Program.cs
rm install.sh