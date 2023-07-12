Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC15EB64DD
	for <workflows@archiver.kernel.org>; Wed, 12 Jul 2023 11:46:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbjGLLq2 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 12 Jul 2023 07:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbjGLLq1 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 12 Jul 2023 07:46:27 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 562D41982
        for <workflows@vger.kernel.org>; Wed, 12 Jul 2023 04:46:25 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b6ff1a637bso110419651fa.3
        for <workflows@vger.kernel.org>; Wed, 12 Jul 2023 04:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689162383; x=1691754383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K6oxAFthf1na6BIIid11QqD+6DrC58Bsamx6gCqg45Q=;
        b=fOzZZHToBty9nPPlmtQ2xc4c0NmYr9Kp0112ouWMxCSKv3VrHxK/RwRA5NgFj20Nyj
         FUGlYZw3trPM35KO+vFdbY0gRdnWdT3urlvr7MIdQQBpQR/mEf3qWCowWNt9O+yd5mLW
         a4a6tN0COlwOQ4nL/jFZFuTDpPFf169C6Zze/Tcapou71FnuOSDGzkTKv6owQ8+dlBOw
         clbd1P26c+ajGDdEFk+xlsa1M42OPEO13GC8BEMHDx0bN4gaSRLs8yUzIizK411mHQ1I
         C6mNo5kohqHp/G3uLhJMwe7qyEyiLHJ5V8SUDfo+tq4neehmiynlElcPIniV+w2icgzh
         ghRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689162383; x=1691754383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K6oxAFthf1na6BIIid11QqD+6DrC58Bsamx6gCqg45Q=;
        b=T/KfGg2rnBY0nYD01IbfoOFPMSnt6+5aZWcfAI64Z/zi9/IF0mYnYFc3q+8lwfNrW6
         9G5Pt8Jkmy5p44DCbl9D7Mmx5flKGY7BrDVJc5IMumjjH1dUwxj8WRUl0yYiKzF7lzSb
         69MRBw6459WPnA8bPB0KeIQIAcrglenLoI+hwNf5niSqDpRA3hnY262SU4x8STd5tuAY
         WU6ykom4soERi/m5V6GEZfc1l9TjHMr17O0gEdCjMtUanfzP3fIX6ZtgF1P57hsAg547
         ZQB4i0x5aAEW9uo1Khyb6HCjNjlmcI4GboTwdZfEZbgcyZSrBipedILa0CLDJZkqLz1w
         EKHg==
X-Gm-Message-State: ABy/qLadzBynF6+q8nHAULGIb5/oYVrCNcX4m9T7bkAiskoxOEP8+1Hv
        u2f5z1lbVvrik1wzHwUyJCUK+SW02IsUiFKnpf8=
X-Google-Smtp-Source: APBJJlH9tLxXyCwdjR9f+WErBAl9fkXrfQotNE+9Zu5RMfsAVFw4GCvJ/UQpv70M5B9nxMbbqanR1A==
X-Received: by 2002:a05:651c:120c:b0:2b5:80e0:f18e with SMTP id i12-20020a05651c120c00b002b580e0f18emr16876660lja.3.1689162383489;
        Wed, 12 Jul 2023 04:46:23 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id l9-20020a170906230900b0099342c87775sm2477707eja.20.2023.07.12.04.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 04:46:22 -0700 (PDT)
Message-ID: <da79ac87-f112-be43-52b2-2293e1a99d9b@linaro.org>
Date:   Wed, 12 Jul 2023 13:46:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] Documentation/process: maintainer-soc: document
 dtbs_check requirement for Samsung
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-arm-kernel@lists.infradead.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230712084131.127982-1-krzysztof.kozlowski@linaro.org>
 <20230712-skier-ribcage-0d82be7e16fd@wendy>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230712-skier-ribcage-0d82be7e16fd@wendy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 12/07/2023 11:48, Conor Dooley wrote:
> On Wed, Jul 12, 2023 at 10:41:31AM +0200, Krzysztof Kozlowski wrote:
>> Samsung ARM/ARM64 SoCs (except legacy S5PV210) are also expected not to
>> bring any new dtbs_check warnings.  In fact this have been already
>> enforced and tested since few release.
>>
>> Cc: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
> 
>> Not sure where to document this. Creating new maintainer profile for
>> Samsung SoC would be an overkill. OTOH, more SoCs might want to grow
>> this list, so this also scales poor.
> 
> To me, this portion of the document was "information to the
> submaintainer", which would be you, not information to the contributors
> to the platform. Adding the comment about Samsung SoC seems aimed at
> contributors?

Yes, I want to document it for contributors, so they won't be surprised.
Any hints where to store it? I could put it in the "About" tab of my
kernel.org repo, but no one checks this for contribution guidelines.

Best regards,
Krzysztof

