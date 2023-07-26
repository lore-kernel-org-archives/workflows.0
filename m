Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F7A8C04A6A
	for <workflows@archiver.kernel.org>; Wed, 26 Jul 2023 18:49:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232163AbjGZStG (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Jul 2023 14:49:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231857AbjGZStF (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Jul 2023 14:49:05 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD80526BB
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 11:49:03 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fbf09a9139so172612e87.2
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 11:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1690397342; x=1691002142;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gssK/9t+yReI1WWHhHksFFEr4iOJwLuyj2VWyW67HMg=;
        b=RNrtpRSLTvNO2OgHpwCznWmRSNMi2w23oMmAxuJFWeOxkQubF2lAVOF2bvMae444OD
         9zVJxJePna8u2jocJu+ZX/i0HqTIpTM12WXczC5ccoG307ABuL+lZIt/qGg+brMh6r0l
         GeeZ73/ZiEJuzwhEiNEyNGla4a0mrOuFpGwVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690397342; x=1691002142;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gssK/9t+yReI1WWHhHksFFEr4iOJwLuyj2VWyW67HMg=;
        b=Jz9bUnyBA2rslVnkeZPN27/29Yc4gjSCmtrX4hXBjVhYfs9+nsP5mzF+ywoxCVs+x4
         pkTWiAq5irBawGBMFm2J54L/4rPWLNE2OOr/4ULi+o/hYomidA8xsQI2DT41zrehFkMC
         Es6obM+6WgY5/DG9OJQsQThheqhWse0otlxMVf2UMFMSUa+mLl81rWgLmnYXnle4SOxX
         ZQFUlDCu3IRuy4CkpjnUUlOaP84/4P89mn+G/2EjAKHJNqmr45aDu0/BIg0lzBNAHoh2
         SYTgZBkKcMVpa3LYlPCJkr/Y/jrUT4wkgFAa4mmZPXw/b4teOTi62Rz0JV5uf6VfXsSI
         dbDg==
X-Gm-Message-State: ABy/qLYvD2qK1Eq0RNk/1QFhHRDIYue297mWWctR2bfaHNSKaRBr3VQ5
        f0ox8JrsKxDVV+aE6Wfcut7k9yYPeODBD8L4L0n8c69V
X-Google-Smtp-Source: APBJJlE9SUJ8ZwYEQvW6/nF+SZhGRHieA0RjC3YF23S0KOutPF/XKaLCQTXd5gcoPn1zvrpZP220KA==
X-Received: by 2002:a05:6512:1188:b0:4f9:571d:c50e with SMTP id g8-20020a056512118800b004f9571dc50emr29246lfr.36.1690397341797;
        Wed, 26 Jul 2023 11:49:01 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id u11-20020ac243cb000000b004fddaddeb63sm3432666lfl.137.2023.07.26.11.49.01
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 11:49:01 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4fe1489ced6so207234e87.0
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 11:49:01 -0700 (PDT)
X-Received: by 2002:a05:6512:2107:b0:4f9:5d2a:e0f5 with SMTP id
 q7-20020a056512210700b004f95d2ae0f5mr16955lfr.19.1690397340786; Wed, 26 Jul
 2023 11:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230726151515.1650519-1-kuba@kernel.org> <11ec5b3819ff17c7013348b766eab571eee5ca96.camel@perches.com>
 <20230726092312.799503d6@kernel.org> <CAHk-=wjEj2fGiaQXrYUZu65EPdgbGEAEMzch8LTtiUp6UveRCw@mail.gmail.com>
 <20230726112031.61bd0c62@kernel.org> <CAHk-=wi9MyyWmP_HAddLrmGfdANkut6_2f9hzv9HcyTBvg3+kA@mail.gmail.com>
 <63361a8f-ffa5-50e7-97d6-297d8e8b059f@amd.com>
In-Reply-To: <63361a8f-ffa5-50e7-97d6-297d8e8b059f@amd.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 26 Jul 2023 11:48:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=whOT-r-W+pOnbkGatKVUpEfNkRwwYxkuy=Stxf475y_Mg@mail.gmail.com>
Message-ID: <CAHk-=whOT-r-W+pOnbkGatKVUpEfNkRwwYxkuy=Stxf475y_Mg@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: get_maintainer: steer people away from using
 file paths
To:     "Limonciello, Mario" <mario.limonciello@amd.com>
Cc:     Jakub Kicinski <kuba@kernel.org>, Joe Perches <joe@perches.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        netdev@vger.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, 26 Jul 2023 at 11:45, Limonciello, Mario
<mario.limonciello@amd.com> wrote:
>
> If the goal is to get people who are involved with a file, how about
> some variation of:

No, that isn't the goal.

The goal is to get the maintainer responsible for that file, so that I
can bring them in.

Maybe it's a security issue that gets reported. Maybe it's an oops.
Maybe it's a regression, but not clear what caused it.

Maybe we could have a script to help do that, and call it
'get_maintainer' or something like that?

              Linus
