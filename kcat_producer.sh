for i in {1..10}; do
  # Use an array and random index instead of shuf
  cities=("Beijing" "Dubai" "London" "New York" "Tokyo")
  random_index=$((RANDOM % 5))
  city=${cities[$random_index]}
  
  temp=$((RANDOM % 15 + 18))
  data="$(date '+%Y-%m-%d %H:%M:%S'),$city,${temp}ºC"
  
  # JSON encode the data (equivalent to dumps(x) in Python)
  json_data=$(printf '"%s"' "$data" | sed 's/º/\\u00ba/g')
  
  echo "$json_data" | kcat -b localhost:9092 -t recitation-x -P
  echo "Writing: $json_data"
  sleep 1
done
