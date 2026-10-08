
#!/usr/bin/env bash
set -euo pipefail

echo "=== Installing .NET 8 SDK ==="

curl -fsSL https://dot.net/v1/dotnet-install.sh -o /tmp/dotnet-install.sh

bash /tmp/dotnet-install.sh \
  --channel 8.0 \
  --install-dir "$HOME/.dotnet"

export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$DOTNET_ROOT:$PATH"

echo "=== .NET version ==="
dotnet --version

echo "=== Restoring dependencies ==="
dotnet restore ProyectoFlor/ProyectoFlor.csproj

echo "=== Publishing Blazor WebAssembly ==="
dotnet publish ProyectoFlor/ProyectoFlor.csproj \
  --configuration Release \
  --output output \
  --no-restore

echo "=== Validating static output ==="
test -f output/wwwroot/index.html
test -d output/wwwroot/_framework

echo "=== Build completed successfully ==="
