<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Trirong">
    <#if section = "form">
            <#if realm.password>
                <form class="form-signin" id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">


                    <img class="mb-4" src="${url.resourcesPath}/img/espresso.png" alt="icon showing a cup of coffee" width="72" height="57">
                    <h1 class="h3 mb-3 fw-normal">Please Login</h1>
                    <div class="form-floating">
                      <input tabindex="1" id="username" class="${properties.kcInputClass!} form-control" name="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="off"
                                   aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"/>
                      <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                    </div>
                    <div class="form-floating">
                      <input tabindex="2" id="password" class="${properties.kcInputClass!} form-control" name="password" type="password" autocomplete="off"
                               aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"/>
                      <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                    </div>

                    <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                    <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!} w-100 btn btn-lg btn-primary" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>

                </form>
            </#if>
    </#if>

</@layout.registrationLayout>