Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5111BC001DE
	for <workflows@archiver.kernel.org>; Wed, 12 Jul 2023 19:37:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232049AbjGLThJ (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 12 Jul 2023 15:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231499AbjGLThI (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 12 Jul 2023 15:37:08 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 089781FD2
        for <workflows@vger.kernel.org>; Wed, 12 Jul 2023 12:37:07 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-991c786369cso2770866b.1
        for <workflows@vger.kernel.org>; Wed, 12 Jul 2023 12:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689190625; x=1691782625;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=181nRb34mOchYAye6iVohgQkjGw1ad08V10xOFxDSTo=;
        b=Je6UUMmaidGnv0Fo0srK1gDbpcBFzA/8I0i8Hz6wr5CDI8G5GY6m6S8p/1aSzZPD5E
         wkK3QhrjuVrKLjIPAot0WktP4GhdW6SIK+yyOKui+2HrhWbMe0mZRoM2+Szcd2+expLN
         75iUfVtIXKguXYqnSBmrIvHB3YTCA3D0eM1+7/piKWktu0jfKzjA/Pje3HkLkZPR0xzY
         0e1cC6uMIeCdnmez16qNSW19W7vVKjLWoobxtfIiya/4uHBeuh8Rf5JvMepOKQ82234/
         U43MF3ZVjgz6qdJtwEVo7AN2pawOukAnfYhpYKtv1+r0yLAM/FsT4NFeCGc5f6hlY8fP
         cmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689190625; x=1691782625;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=181nRb34mOchYAye6iVohgQkjGw1ad08V10xOFxDSTo=;
        b=TYBxylb6cwns8+Hg04zLBo/nDBiTpf6hDZ0fR7cfiy82yzUFBfxwN/9vS0c49/BWD8
         z5wUGrpYfu8Y+yt35dyTMEVcAbMVkqldLa54qzzg88HhOTHroNyDr1r56Q3Ghf/fCHLT
         SRXHb+Di8Gwpq7WIW4dL+MQhBM0BfNkNcwUSZ8vNpqsSjHc4FgCk6SX74PvI+krd5vrb
         Lasd+3YnbMWb+eBf3oIPgaJRMHpkwmO0qydbDbkLGFs2E1ABhOQT8ANZYKGFCbm41Svu
         Ft5gmUHtJ8IDizOUrl1gIA+WqLva/JNL0dsNhpMCctzh96ZDEBeJ95sNtXt2NNtwTQG8
         9NbA==
X-Gm-Message-State: ABy/qLaQFuY/Mds1zSwu5FzQ4Cy8g4sOfYwe/GFv9xkTtawZtsiBDYs/
        ek9aVbF+q/dU4Y4WAXCS1HUXww==
X-Google-Smtp-Source: APBJJlF+g5n2353+b/lgRe+uVfxvvxpHFQBAfIRl+jrS3le4CKoUwHgcKyqYYTIDFLe4gKFeQBe7uw==
X-Received: by 2002:a17:906:c30e:b0:992:16bb:2b6e with SMTP id s14-20020a170906c30e00b0099216bb2b6emr17483852ejz.29.1689190625528;
        Wed, 12 Jul 2023 12:37:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id b14-20020a17090636ce00b0098d486d2bdfsm2992208ejc.177.2023.07.12.12.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 12:37:04 -0700 (PDT)
Message-ID: <0beb714b-7e8d-6699-6f09-df68b9307f1c@linaro.org>
Date:   Wed, 12 Jul 2023 21:37:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] Documentation/process: maintainer-soc: document
 dtbs_check requirement for Samsung
Content-Language: en-US
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-arm-kernel@lists.infradead.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230712084131.127982-1-krzysztof.kozlowski@linaro.org>
 <20230712-skier-ribcage-0d82be7e16fd@wendy>
 <da79ac87-f112-be43-52b2-2293e1a99d9b@linaro.org>
 <20230712-unfasten-trespass-d57b3ff1f134@wendy>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230712-unfasten-trespass-d57b3ff1f134@wendy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 12/07/2023 14:34, Conor Dooley wrote:
> On Wed, Jul 12, 2023 at 01:46:20PM +0200, Krzysztof Kozlowski wrote:
>> On 12/07/2023 11:48, Conor Dooley wrote:
>>> On Wed, Jul 12, 2023 at 10:41:31AM +0200, Krzysztof Kozlowski wrote:
>>>> Samsung ARM/ARM64 SoCs (except legacy S5PV210) are also expected not to
>>>> bring any new dtbs_check warnings.  In fact this have been already
>>>> enforced and tested since few release.
>>>>
>>>> Cc: Conor Dooley <conor.dooley@microchip.com>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>
>>>> ---
>>>
>>>> Not sure where to document this. Creating new maintainer profile for
>>>> Samsung SoC would be an overkill. OTOH, more SoCs might want to grow
>>>> this list, so this also scales poor.
>>>
>>> To me, this portion of the document was "information to the
>>> submaintainer", which would be you, not information to the contributors
>>> to the platform. Adding the comment about Samsung SoC seems aimed at
>>> contributors?
>>
>> Yes, I want to document it for contributors, so they won't be surprised.
>> Any hints where to store it? I could put it in the "About" tab of my
>> kernel.org repo, but no one checks this for contribution guidelines.
> 
> I've not got a better suggestion for where to put this, but under
> something labelled as "Information for (new) Submaintainers" isn't
> where I would be looking as a contributor.

Yeah, true.

> Is adding to the generic DT documentation that dtbs_check should not add
> any new warnings at W=1 too extreme?

It is to extreme. Several sub-arch maintainers might prioritize features
than DT schema compliance. I would say it is their choice, even if I
don't agree with it.

> writing-schema.rst has the instructions about how to run dtbs_check while
> writing dt-binding patches, but we don't seem to have any docs about
> running dtbs_check for dts/dtsi changes.

Maybe I will add generic maintainer-sub-arch-soc profile doc which then
can be linked by multiple soc subsystems.

Best regards,
Krzysztof

