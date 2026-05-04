<template>
  <main class="min-h-screen bg-gray-950 p-6 pt-14 max-w-lg mx-auto space-y-8">

    <!-- Profile header -->
    <div class="text-center space-y-4">
      <div
        v-if="acc.i"
        class="h-24 w-24 rounded-full overflow-hidden ring-2 ring-gray-700 mx-auto"
      >
        <img :src="acc.i" alt="profile" class="h-full w-full object-cover" />
      </div>
      <div v-else class="h-24 w-24 rounded-full overflow-hidden ring-2 ring-gray-700 mx-auto bg-gray-800 flex items-center justify-center">
        <icon name="ph:user-circle-duotone" class="h-12 w-12 text-gray-600" />
      </div>
      <h1 v-if="acc.n" class="text-3xl font-bold text-white">{{ acc.n }}</h1>
      <p v-if="acc.d" class="text-sm text-gray-400 leading-relaxed">{{ acc.d }}</p>
    </div>

    <!-- Social icons row -->
    <div v-if="!allSocialLinksAreEmpty" class="flex items-center justify-center flex-wrap gap-1">
      <a v-if="acc.f" :href="acc.f" target="_blank" rel="noopener noreferrer" class="p-2 rounded-full hover:bg-gray-800 text-gray-400 hover:text-white transition-colors">
        <icon name="ph:facebook-logo-duotone" class="h-5 w-5" />
      </a>
      <a v-if="acc.t" :href="acc.t" target="_blank" rel="noopener noreferrer" class="p-2 rounded-full hover:bg-gray-800 text-gray-400 hover:text-white transition-colors">
        <icon name="ph:twitter-logo-duotone" class="h-5 w-5" />
      </a>
      <a v-if="acc.ig" :href="acc.ig" target="_blank" rel="noopener noreferrer" class="p-2 rounded-full hover:bg-gray-800 text-gray-400 hover:text-white transition-colors">
        <icon name="ph:instagram-logo-duotone" class="h-5 w-5" />
      </a>
      <a v-if="acc.gh" :href="acc.gh" target="_blank" rel="noopener noreferrer" class="p-2 rounded-full hover:bg-gray-800 text-gray-400 hover:text-white transition-colors">
        <icon name="ph:github-logo-duotone" class="h-5 w-5" />
      </a>
      <a v-if="acc.tg" :href="acc.tg" target="_blank" rel="noopener noreferrer" class="p-2 rounded-full hover:bg-gray-800 text-gray-400 hover:text-white transition-colors">
        <icon name="ph:telegram-logo-duotone" class="h-5 w-5" />
      </a>
      <a v-if="acc.w" :href="`https://wa.me/${acc.w}`" target="_blank" rel="noopener noreferrer" class="p-2 rounded-full hover:bg-gray-800 text-gray-400 hover:text-white transition-colors">
        <icon name="ph:whatsapp-logo-duotone" class="h-5 w-5" />
      </a>
      <a v-if="acc.y" :href="acc.y" target="_blank" rel="noopener noreferrer" class="p-2 rounded-full hover:bg-gray-800 text-gray-400 hover:text-white transition-colors">
        <icon name="ph:youtube-logo-duotone" class="h-5 w-5" />
      </a>
      <a v-if="acc.e" :href="`mailto:${acc.e}`" target="_blank" rel="noopener noreferrer" class="p-2 rounded-full hover:bg-gray-800 text-gray-400 hover:text-white transition-colors">
        <icon name="ph:envelope-duotone" class="h-5 w-5" />
      </a>
      <a v-if="acc.l" :href="acc.l" target="_blank" rel="noopener noreferrer" class="p-2 rounded-full hover:bg-gray-800 text-gray-400 hover:text-white transition-colors">
        <icon name="ph:linkedin-logo-duotone" class="h-5 w-5" />
      </a>
    </div>

    <!-- Custom links -->
    <ul class="space-y-3">
      <li v-for="(link, id) in acc.ls" :key="id">
        <nuxt-link
          v-if="link.l && link.u"
          :to="link.u"
          target="_blank"
          class="flex items-center space-x-3 p-3 rounded-xl bg-gray-800 hover:bg-gray-700 border border-gray-700 hover:border-gray-500 transition-all"
        >
          <div class="flex-shrink-0 flex h-9 w-9 items-center justify-center rounded-lg bg-gray-700 text-gray-300">
            <icon v-if="link.i" :name="link.i" class="h-5 w-5" />
            <icon v-else name="ph:link-simple" class="h-5 w-5" />
          </div>
          <span class="font-medium text-sm text-gray-100">{{ link.l }}</span>
        </nuxt-link>
      </li>
    </ul>
  </main>
</template>

<script setup>
const props = defineProps({
  acc: { type: Object, required: true },
});

const allSocialLinksAreEmpty = computed(() => {
  return !props.acc.f && !props.acc.t && !props.acc.ig && !props.acc.tg &&
         !props.acc.w && !props.acc.y && !props.acc.e && !props.acc.gh && !props.acc.l;
});
</script>
