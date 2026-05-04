<template>
  <div class="h-screen grid place-items-center bg-gray-900">
    <div
      class="h-[729px] w-[340px] overflow-y-auto rounded-[3rem] ring-8 ring-gray-700 overflow-hidden"
    >
      <templates-simple :acc="data" />
    </div>
  </div>
</template>
<script setup>
const props = defineProps({
  data: {
    type: Object,
    required: true,
  },
});
</script>
<style scoped></style>
