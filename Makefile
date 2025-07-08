test:
        @swift test -v

format:
	@command -v swift-format >/dev/null 2>&1 || { echo "❌ swift-format not installed"; exit 1; }
        @echo "🔧 Running swift-format..."
        @swift-format format --recursive --in-place .
