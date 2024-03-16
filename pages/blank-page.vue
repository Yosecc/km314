<template>
  <div>
    <section id="home" />
    <main-container invert>
      <section class="space-top space-bottom">
        <h2 class="use-text-title2 text-center mb-4">
          {{ $t('common.title') }}
        </h2>
        <h4 class="use-text-subtitle2 text-center">
          {{ $t('common.subtitle') }}
        </h4>
      </section>
      <notification />
    </main-container>
  </div>
</template>

<style scoped lang="scss">
@function section-margin($margin) {
  @return $margin * 20;
}
.space-bottom {
  margin-bottom: section-margin($spacing1);
}
.space-top {
  margin-top: section-margin($spacing1);
}
.container-wrap {
  margin-top: $spacing10;
  padding: $spacing4;
  > section {
    position: relative;
  }
}
</style>

<script>
import MainContainer from '@/components/MainContainer';
import Notification from '@/components/Notification';
import brand from '@/assets/text/brand';

export default {
  components: {
    MainContainer,
    Notification,
  },
  head() {
    return {
      title: brand.architect.name + ' - Blank Page',
    };
  },
};
</script>
