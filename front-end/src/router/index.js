import { createRouter, createWebHistory } from 'vue-router';
import IntroduceWeb from '../components/IntroduceWeb.vue';
import HomePage from '../components/HomePage.vue';
import AllFacilities from '../components/AllFacilities.vue';
import AddFacilities from '../components/AddFacilities.vue';
import AddCertificate from '../components/AddCertificate.vue';
import StandardFacilities from '../components/StandardFacilities.vue';
import SubstandardFacilities from '../components/SubstandardFacilities.vue';
import AllCertificates from '../components/AllCertificates.vue';
import AddPlan from '../components/AddPlan.vue';
import AllPlans from '../components/AllPlans.vue';
import BadFacilities from '../components/BadFacilities.vue';
import SignUp from '../components/SignUp.vue';
import SignIn from '../components/SignIn.vue';
import PageHeader from '../components/PageHeader.vue'
import InfoFacilities from '../components/InfoFacilities.vue';
import EditFacility from '../components/EditFacility.vue';
import UserInfo from '../components/UserInfo.vue';
import SearchData from '../components/SearchData.vue';
import SamplesTest from '../components/SamplesTest.vue';
import AddSample from '../components/AddSample.vue';
//Tạo tập các đường dẫn
const routes = [{
        path: '/introduce',
        component: IntroduceWeb
    },
    {
        path: '/header',
        component: PageHeader
    },
    {
        path: '/',
        component: HomePage
    },
    {
        path: '/facilities',
        component: AllFacilities
    },
    {
        path: '/addfacility',
        component: AddFacilities
    },
    {
        path: '/standardfacilities',
        component: StandardFacilities
    },
    {
        path: '/substandardfacilities',
        component: SubstandardFacilities
    },
    {
        path: '/certificates',
        component: AllCertificates
    },
    {
        path: '/addcertificate',
        component: AddCertificate
    },
    {
        path: '/allplans',
        component: AllPlans
    },
    {
        path: '/addplan',
        component: AddPlan
    },
    {
        path: '/badfacilities',
        component: BadFacilities
    },
    {
        path: '/signup',
        component: SignUp
    },
    {
        path: '/signin',
        component: SignIn
    },
    {
        path: '/facility/:id',
        component: InfoFacilities
    },
    {
        path: '/facility/:id/edit',
        component: EditFacility
    },
    {
        path: '/user/:id',
        component: UserInfo
    },
    {
        path: '/search',
        component: SearchData
    },
    {
        path: '/allsamples',
        component: SamplesTest
    },
    {
        path: '/addsample',
        component: AddSample
    }
];
const router = createRouter({
    history: createWebHistory(),
    routes,
    scrollBehavior() {
        return {
            left: 0,
            top: 150,
            behavior: 'smooth'
        }

    }

})

export default router