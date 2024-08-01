#!/bin/bash

# Путь к файлу со значениями тегов
TAG_VALUES_FILE="tag-values.txt"
# ID ключа тега
TAG_KEY_ID="[ID]"

# Чтение каждой строки в файле и использование её как значения тега
while IFS= read -r tag_value; do
  echo "Creating tag value: $tag_value"
  # Создание значения тега с заданным именем
  gcloud resource-manager tags values create "$tag_value" --parent="tagKeys/$TAG_KEY_ID"
done < "$TAG_VALUES_FILE"
