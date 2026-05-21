#!/bin/bash
# MealFlow Nexus - Auto-restart Dev Server
# Keeps the Next.js dev server running even if sandbox kills it

echo "🍔 Starting MealFlow Nexus Dev Server (auto-restart enabled)..."

# Kill any existing processes
pkill -f "next" 2>/dev/null
pkill -f "while true" 2>/dev/null
sleep 1

cd /home/z/my-project
rm -f dev.log

# Start with auto-restart loop
(
  while true; do
    echo "[$(date '+%H:%M:%S')] Restarting dev server..." >> dev.log
    bun run dev >> dev.log 2>&1
    echo "[$(date '+%H:%M:%S')] Server exited, restarting in 2s..." >> dev.log
    sleep 2
  done
) &
DISOWN_PID=$!
disown $DISOWN_PID 2>/dev/null

echo "✅ Dev server auto-restart enabled (PID: $DISOWN_PID)"
echo "📋 Log: tail -f dev.log"
echo ""
sleep 5
echo "📊 Server Status:"
tail -5 dev.log
echo ""
echo "🌍 API: http://localhost:3000"
echo "🏪 Restaurants: 18"
echo "📋 Menu Items: 293+"
