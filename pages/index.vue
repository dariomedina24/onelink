<template>
  <div class="h-screen grid grid-cols-3 divide-x divide-gray-700">
    <div class="col-span-2 h-screen flex flex-col bg-gray-950">
      <div class="flex-1 overflow-y-auto p-8">
        <app-form-profile
          v-model:name="data.n"
          v-model:desc="data.d"
          v-model:image="data.i"
        />
        <app-form-hr />
        <app-form-social-links
          :modelValue="data"
          @update:f="(val) => data.f = val"
          @update:t="(val) => data.t = val"
          @update:ig="(val) => data.ig = val"
          @update:gh="(val) => data.gh = val"
          @update:tg="(val) => data.tg = val"
          @update:l="(val) => data.l = val"
          @update:e="(val) => data.e = val"
          @update:w="(val) => data.w = val"
          @update:y="(val) => data.y = val"
        />
        <app-form-hr />
        <app-form-links v-model="data.ls" />
      </div>
      <div class="border-t border-gray-700 bg-gray-900 flex items-center">
        <button
          @click="prefillDemoData"
          class="h-12 flex items-center space-x-2 px-4 border-r border-gray-700 text-xs font-medium bg-gray-900 text-gray-300 hover:bg-gray-800 transition-colors"
        >
          <span> Add demo data </span>
          <icon name="mdi:code-json" class="h-4 w-4" />
        </button>
        <button
          @click="publish"
          class="h-12 flex items-center space-x-2 px-4 border-r border-gray-700 text-xs font-medium bg-gray-900 text-gray-300 hover:bg-gray-800 transition-colors"
        >
          <span> Publish </span>
          <icon name="ph:paper-plane-tilt-bold" class="h-4 w-4" />
        </button>
        <a
          href="https://github.com/fayazara/onelink"
          target="_blank"
          class="h-12 flex items-center space-x-2 px-4 border-r border-gray-700 text-xs font-medium bg-gray-900 text-gray-300 hover:bg-gray-800 transition-colors"
        >
          <span> Github </span>
          <icon name="mdi:github" class="h-4 w-4" />
        </a>
      </div>
    </div>
    <app-form-preview :data="data" />
    <a
      href="https://twitter.com/fayazara"
      target="_blank"
      class="absolute bottom-0 right-0 bg-gray-900 rounded-tl-lg shadow px-4 py-1 font-medium text-sm text-gray-400 border-l border-t border-gray-700"
    >
      Made by Fayaz
    </a>
  </div>
</template>

<script setup>
import { encodeData } from "../utils/transformer";
const data = ref({
  n: "",
  d: "",
  i: "",
  f: "",
  t: "",
  ig: "",
  gh: "",
  tg: "",
  l: "",
  e: "",
  w: "",
  y: "",
  ls: [],
});

const prefillDemoData = () => {
  data.value = {
    n: "John Snow",
    d: "I’m John Snow, the king in the north. I know Nothing.",
    i: "https://i.insider.com/56743fad72f2c12a008b6cc0",
    f: "https://www.facebook.com/john_snow",
    t: "https://twitter.com/john_snow",
    ig: "https://www.instagram.com/john_snow",
    e: "mail@john_snow.cc",
    gh: "https://github.com/john_snow",
    tg: "https://t.me/john_snow",
    w: "+918888888888",
    y: "https://youtube.com/@john_snow",
    l: "https://linkedin.com/john_snow",
    ls: [
      {
        l: "My Website",
        i: "ph:globe-duotone",
        u: "https://example.com",
      },
      {
        l: "Amazon wishlist",
        i: "ant-design:amazon-outlined",
        u: "https://amazon.in",
      },
      {
        l: "React JS course",
        i: "grommet-icons:reactjs",
        u: "https://reactjs.org/",
      },
      {
        l: "Donate for our cause",
        i: "iconoir:donate",
        u: "https://who.int",
      },
      {
        l: "Download my resume",
        i: "ph:file-pdf",
        u: "https://google.com",
      },
    ],
  };
};

const publish = () => {
  const url = `${window.location.origin}/1?data=${encodeData(data.value)}`;
  navigator.clipboard.writeText(url).then(() => {
    alert("Link copied to clipboard");
  });
};
</script>
