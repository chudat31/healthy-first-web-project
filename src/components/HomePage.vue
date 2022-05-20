<template>
<page-header id="header"/>
<page-body id="body" />
<page-footer id="footer"/>
</template>

<script>
import PageHeader from './PageHeader'
import PageBody from './PageBody'
import PageFooter from './PageFooter'

export default {
    name: "HomePage",
    components: {PageHeader, PageBody, PageFooter}
}
</script>

<style lang="scss" scoped>

#body {
    margin-top: 50px;
    margin-bottom: 50px;
}
</style>