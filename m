Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DBA0C001DF
	for <workflows@archiver.kernel.org>; Wed, 26 Jul 2023 18:30:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbjGZSaG (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Jul 2023 14:30:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231434AbjGZSaF (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Jul 2023 14:30:05 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DDD62691
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 11:30:04 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so2797040a12.1
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 11:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1690396202; x=1691001002;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pqzzz+WGHeTgkjEnwwenqQNoyLcS/ky4WeoPGc3iJ2Q=;
        b=YA5MjgoDWlxvTFYKhUE6/dPAQhniknN4M3/1DCroxpOzpeFgDj6FH6m5mjQlj7LaHu
         ZPqSi9JBYdO7quOrDHv6xCSy30Rw9t4WqGYiNZMEPk0bBQ8Y2mrtfTmTzCIWmQCVBxLJ
         OzDpMrusLx6Sw921aTq9PFZsSASuqHDOgQSzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690396202; x=1691001002;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pqzzz+WGHeTgkjEnwwenqQNoyLcS/ky4WeoPGc3iJ2Q=;
        b=ALhE69ecWB1Gnaklk2acOK8IoKttLKuuo//tqrIYznBsMjWh/6JGM2ns9z3e9CfNFb
         UXRmdB0D+R701nlj95P+ijGp7TkawXRs4ZH4P978a2X5F+fJ++a901fsU/PyS8O+knzd
         gAvt9YDI1dm5o+LCPwHQCipNQuc3TFtYIRLKial1K0ocRMWjCxKf4oAH1HwYPeOzqkYi
         17M6BsoayIwtXSJy4CUV4WttUjhOmT6vL21YeLznAUh3ug8syquV6Z1H/PGaZFrmLFeo
         CcIU6sOrBN9BQg2otAEB6IGxY9AFVqGgmVPPm7/F2fCDl0uT4JlF9+ppJ7pFAfRpCsJ7
         zKtQ==
X-Gm-Message-State: ABy/qLaWeV7oOGY+JB9f1OnWjRmOcc0c4bn18G4VIaz2osFePc8m4M6r
        cu3n2XyFlZmSTdAp62Ddxp9t0aXoeEMJQS8Zc4zVnqBf
X-Google-Smtp-Source: APBJJlHSiTpXcsBCSkUVwx2wAZRdw7IU83155gCoXEvzwaFpCmchNabmLo2H0agyQDknCg4nQy3LwQ==
X-Received: by 2002:a17:906:51dd:b0:992:ef60:aadd with SMTP id v29-20020a17090651dd00b00992ef60aaddmr473093ejk.13.1690396202492;
        Wed, 26 Jul 2023 11:30:02 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id v27-20020a170906339b00b00985ed2f1584sm9980110eja.187.2023.07.26.11.30.01
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 11:30:02 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9891c73e0fbso7736766b.1
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 11:30:01 -0700 (PDT)
X-Received: by 2002:a17:906:7391:b0:993:eee4:e704 with SMTP id
 f17-20020a170906739100b00993eee4e704mr252853ejl.38.1690396201556; Wed, 26 Jul
 2023 11:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230726151515.1650519-1-kuba@kernel.org> <11ec5b3819ff17c7013348b766eab571eee5ca96.camel@perches.com>
 <20230726092312.799503d6@kernel.org> <CAHk-=wjEj2fGiaQXrYUZu65EPdgbGEAEMzch8LTtiUp6UveRCw@mail.gmail.com>
 <20230726112031.61bd0c62@kernel.org>
In-Reply-To: <20230726112031.61bd0c62@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 26 Jul 2023 11:29:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi9MyyWmP_HAddLrmGfdANkut6_2f9hzv9HcyTBvg3+kA@mail.gmail.com>
Message-ID: <CAHk-=wi9MyyWmP_HAddLrmGfdANkut6_2f9hzv9HcyTBvg3+kA@mail.gmail.com>
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

On Wed, 26 Jul 2023 at 11:20, Jakub Kicinski <kuba@kernel.org> wrote:
>
> You are special,

So my mother tells me.

> you presumably use it to find who to report
> regressions to, and who to pull into conversations.

Yes. So what happens is that I get cc'd on bug reports for various
issues, and particularly for oops reports I basically have a function
name to grep for (maybe a pathname if it went through the full
decoding).

I'm NOT interested in having to either remember all people off-hand,
or going through the MAINTAINERS file by hand.

> This tool is primarily used by _developers_ to find _maintainers_.

Well, maybe.

But even if that is true, I don't see why you hate the pathname thing
even for that case. I bet developers use it for that exact same
reason, ie they are modifying a file, and they go "I want to know who
the maintainer for this file is".

I do not understand why you think a patch is somehow magically more
important or relevant than a filename.

               Linus
