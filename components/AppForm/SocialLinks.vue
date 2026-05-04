<template>
  <base-form-section
    title="Social Links"
    description="Add some social media links"
  >
    <div class="shadow sm:overflow-hidden sm:rounded-md">
      <div class="grid grid-cols-2 gap-8 bg-white px-4 py-5 sm:p-6">
        <div v-for="link in socialLinks" :key="link.key">
          <label :for="link.key" class="block text-sm font-medium text-gray-700">
            {{ link.label }}
          </label>
          <div class="mt-1 flex rounded-md shadow-sm">
            <span class="inline-flex items-center rounded-l-md border border-r-0 border-gray-300 bg-gray-50 px-3 text-sm text-gray-500">
              <icon :name="link.icon" class="w-5 h-5" />
            </span>
            <input
              type="search"
              :name="link.key"
              :id="link.key"
              :value="modelValue[link.key]"
              @input="$emit('update:' + link.key, $event.target.value)"
              class="block w-full flex-1 rounded-none rounded-r-md border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
              :placeholder="link.placeholder"
            />
          </div>
        </div>
      </div>
    </div>
  </base-form-section>
</template>

<script setup>
const props = defineProps({
  modelValue: Object,
});

const socialLinks = [
  { key: 'f', label: 'Facebook', icon: 'ph:facebook-logo-duotone', placeholder: 'https://fb.com/username' },
  { key: 't', label: 'Twitter', icon: 'ph:twitter-logo-duotone', placeholder: 'https://twitter.com/username' },
  { key: 'ig', label: 'Instagram', icon: 'ph:instagram-logo-duotone', placeholder: 'https://instagram.com/username' },
  { key: 'gh', label: 'Github', icon: 'ph:github-logo-duotone', placeholder: 'https://github.com/username' },
  { key: 'tg', label: 'Telegram', icon: 'ph:telegram-logo-duotone', placeholder: 'https://t.me/username' },
  { key: 'l', label: 'Linkedin', icon: 'ph:linkedin-logo-duotone', placeholder: 'https://linkedin.com/in/username' },
  { key: 'e', label: 'Email', icon: 'ph:envelope-duotone', placeholder: 'user@example.com' },
  { key: 'y', label: 'Youtube', icon: 'ph:youtube-logo-duotone', placeholder: 'https://youtube.com/@username' },
  { key: 'w', label: 'Whatsapp', icon: 'ph:whatsapp-logo-duotone', placeholder: '+1234567890' },
];
</script>
