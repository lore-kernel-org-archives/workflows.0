Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F49EC001DC
	for <workflows@archiver.kernel.org>; Wed, 26 Jul 2023 18:59:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbjGZS70 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Jul 2023 14:59:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbjGZS70 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Jul 2023 14:59:26 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78856212D
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 11:59:24 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fe0eb0ca75so196901e87.2
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 11:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1690397962; x=1691002762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9ltB90dbZBs9x2w+zTel/ot+HALu1Ht+7bi6jGbPAdk=;
        b=H2XJWiCoD7KhXfeojnRimRKEFZc2C/9H5g8aJ4i1DGkWQVukNSDP33l4XgAR3Vr9q7
         CJG0DYnu+674+LKE0mfCHvAvLMZ75UrdhRTrU30CAglnbvmOv3qyb0iWgsD8pTXPDOrc
         xxd3Gpjakobk15VI731GXxslOpbzWfz+pyo6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690397962; x=1691002762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ltB90dbZBs9x2w+zTel/ot+HALu1Ht+7bi6jGbPAdk=;
        b=lYM5A/XU2TniTzHuFDu/LPREna20GVQ5UgIwFWzu/OmobFKGkni78v5H4GkXN8rU+9
         fANUha6EpvLqcFqOS3H6/MeKPg6HleXyKmWzKF3IGFFF8+px1NPKTLed7sYeSqG+RdJy
         pB9aqHzsEOPCYEqJdKsU4aXTnTgOVLmeHjIReIPzFDNFu8O6keWU5cPxxYmcYooubGCO
         1gDYnfjKc4Vxy2EiYQiWbhIEja3w16KRSN+l0qBMFczN9/hYPQ7DiGGaN5wDYq8D0LJc
         0NUxlsdHuKwQVAHxobrDj8btDFRNX0ouf/otvx4i+lkmydUtRuPBTNSjNebPO4PQF5qW
         rcjw==
X-Gm-Message-State: ABy/qLbSDYj3oS0RRpqBYvAc0tw5pDPaxDXJhDL/ksPBYkCWFK4Bz1pv
        IadT53o/D2ABiOizMjjxcKHlTDVvzKA43ucSGavWLPIv
X-Google-Smtp-Source: APBJJlF9B+3GNMSq/j81uUczMhYjaMyXS/PzGSPpzT6fBotiuSSn9Pv2CBaABqqAqz8nz1LwgS1TRA==
X-Received: by 2002:a05:6512:682:b0:4fb:893e:8ffc with SMTP id t2-20020a056512068200b004fb893e8ffcmr40191lfe.17.1690397962425;
        Wed, 26 Jul 2023 11:59:22 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id r6-20020ac24d06000000b004fdfd2d0659sm1219438lfi.277.2023.07.26.11.59.21
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 11:59:21 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2b97f34239cso887021fa.3
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 11:59:21 -0700 (PDT)
X-Received: by 2002:a2e:9510:0:b0:2b5:9d2a:ab51 with SMTP id
 f16-20020a2e9510000000b002b59d2aab51mr1859153ljh.5.1690397960827; Wed, 26 Jul
 2023 11:59:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230726151515.1650519-1-kuba@kernel.org> <11ec5b3819ff17c7013348b766eab571eee5ca96.camel@perches.com>
 <20230726092312.799503d6@kernel.org> <CAHk-=wjEj2fGiaQXrYUZu65EPdgbGEAEMzch8LTtiUp6UveRCw@mail.gmail.com>
 <20230726112031.61bd0c62@kernel.org> <CAHk-=wi9MyyWmP_HAddLrmGfdANkut6_2f9hzv9HcyTBvg3+kA@mail.gmail.com>
 <20230726114817.1bd52d48@kernel.org>
In-Reply-To: <20230726114817.1bd52d48@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 26 Jul 2023 11:59:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiuR7_A=PbN8jhmqGPJQHypUHR+W4-UuSVhOVWvYXs1Tg@mail.gmail.com>
Message-ID: <CAHk-=wiuR7_A=PbN8jhmqGPJQHypUHR+W4-UuSVhOVWvYXs1Tg@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: get_maintainer: steer people away from using
 file paths
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Joe Perches <joe@perches.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        netdev@vger.kernel.org, workflows@vger.kernel.org,
        mario.limonciello@amd.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, 26 Jul 2023 at 11:48, Jakub Kicinski <kuba@kernel.org> wrote:
>
> We get at least one fix a week where author adds a Fixes tag
> but somehow magically didn't CC the author of that commit.
> When we ask they usually reply with "but I run get_maintainer -f,
> isn't that what I'm supposed to do?".

Bah. I think you're blaming entirely the wrong people, and the wrong tool.

Your complaint seems to be "we got a fix, it even says what commit it
is fixing, and the tool that the person ran didn't add the right
people automatically".

And my reaction is "I use that tooling, I want it to do exactly what
it does right now, why are you blaming that tool"?

You're already using 'patchwork'. Why don't you instead go "Oh, *that*
tool isn't doing the right thing?"

                  Linus
