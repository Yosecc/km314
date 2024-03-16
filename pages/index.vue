<template>
  <div>
    <main-container nav-scroll>
      <section id="home">
        <video-banner />
      </section>
      <section id="services" class="space-top-short">
        <services />
      </section>
      <section id="project" :class="[isMobile ? 'space-top-short' : 'space-top']">
        <project />
      </section>
      <section id="featured" :class="[isMobile ? 'space-top-short' : 'space-top']">
        <featured />
      </section>
      <section id="about">
        <div :class="[isTablet ? 'space-top-short' : 'space-top']">
          <about />
        </div>
        <div class="space-top-short">
          <team />
        </div>
        <div>
          <counter />
        </div>
      </section>
      <div id="blog" class="space-top-short">
        <blog />
      </div>
      <section id="subscribe" class="space-top-short">
        <subscribe-form />
      </section>
      <hidden point="mdDown">
        <page-nav />
      </hidden>
      <hidden point="mdDown">
        <notification />
      </hidden>
    </main-container>
  </div>
</template>

<style scoped lang="scss">
@function section-margin($margin) {
  @return $margin * 20;
}
.space-bottom {
  padding-bottom: section-margin($spacing1);
  @include breakpoints-down(md) {
    padding-bottom: section-margin(6px);
  }
}
.space-bottom-short {
  padding-bottom: section-margin($spacing1 * 0.5);
}
.space-top {
  padding-top: section-margin($spacing1);
  @include breakpoints-down(md) {
    padding-top: section-margin(6px);
  }
}
.space-top-short {
  padding-top: section-margin($spacing1 * 0.5);
}
.container-wrap {
  > section {
    position: relative;
  }
}
</style>

<script>
import { onMounted } from 'vue';
import { useI18n } from 'vue-i18n';
import MainContainer from '@/components/MainContainer';
import VideoBanner from '@/components/VideoBanner';
import Services from '@/components/Services';
import Project from '@/components/Project';
import Featured from '@/components/Featured';
import About from '@/components/About';
import Team from '@/components/Team';
import Counter from '@/components/Counter';
import Blog from '@/components/Blog';
import SubscribeForm from '@/components/SubscribeForm';
import Hidden from '@/components/Hidden';
import PageNav from '@/components/PageNav';
import Notification from '@/components/Notification';
import brand from '@/assets/text/brand';
import { defineNuxtComponent, useRouter, useCookie } from '#app';

export default defineNuxtComponent({
  components: {
    MainContainer,
    VideoBanner,
    Services,
    Project,
    Featured,
    About,
    Team,
    Counter,
    Blog,
    SubscribeForm,
    PageNav,
    Hidden,
    Notification,
  },
  setup() {
    // push route to the stored cookie languages only for index page
    const router = useRouter();
    const storedLang = useCookie('i18n_redirected');
    const i18nLocale = useI18n();

    const defaultLocale = '/' + i18nLocale.fallbackLocale.value;
    onMounted(() => {
      const rootUrl = document.location.pathname === '/' || document.location.pathname === defaultLocale;
      if (storedLang.value && rootUrl) {
        router.push({ path: `/${storedLang.value}` });
      }
    });
  },
  head() {
    return {
      title: brand.architect.name + ' - Home Page',
    };
  },
  computed: {
    isTablet() {
      const mdDown = this.$vuetify.display.mdAndDown;
      return mdDown;
    },
    isMobile() {
      const xsDown = this.$vuetify.display.xsAndDown;
      return xsDown;
    },
  },
});
</script>
