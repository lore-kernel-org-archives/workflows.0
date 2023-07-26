Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEAA8C001DC
	for <workflows@archiver.kernel.org>; Wed, 26 Jul 2023 16:46:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbjGZQqK (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Jul 2023 12:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjGZQqC (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Jul 2023 12:46:02 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BDCB271B
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 09:45:46 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fe0fe622c3so1599419e87.2
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 09:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1690389944; x=1690994744;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C4mt+ojB+SP10w1OfygrpNmF+pEvocjVGgRwsRvZpZc=;
        b=IZvMpzLllqI8kGs63oQoxaC1ivFZGhcl+AxYkXdEKCrmxPQAUEx3GMR3wfTSEkYK4n
         VqzB51zQqfLo2hjrSdi5Bt1vmQdBFUdzb/lb6J/qVRkabrV6+79Qn/N2BoZKZ+tMeZdP
         ewvhq6vfigxca10zBIuKGek8CV9a9N6g8Bc00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690389944; x=1690994744;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C4mt+ojB+SP10w1OfygrpNmF+pEvocjVGgRwsRvZpZc=;
        b=gj/VQYAEebahkOYUxJgLY6GrJjTRxjIpHfZktKedd+IUAaybLw5JqPN/eEotcPpKEw
         NjGVyHp5tY0QSovr/opy2JhI+5nWxby4MBOOlD1JJJDxab/LaQjyauYbVGMkjKUA2Oqj
         jHrX7GY4E90R6bHlJENCrNmEHzt9tBvWThjSkzukuVIH7Gs5e7uZhpMVEENWZhm2XoaS
         rOL9VpImxmxjq3wSh2zK2ndYh9/uEjnetzZr9FiMrSlDWXq1dU9YY/tOLbg9YvVKNVPT
         oCEJBCekU8azGvqr+ealPqCQwFwrpGvdZSPg6vCMR/xxWFO0jaZcslilFGEQRG4kUHcV
         NaCw==
X-Gm-Message-State: ABy/qLbqPxppq4gxnuSIpBQjUVaxOzMIHHJw9KNzMHBE9j5ypj5M6/cG
        pI/bBkNa+pGhh1INgxPJm75MaEIYMOuxh8soaTwVlZZe
X-Google-Smtp-Source: APBJJlE8AP0+IWgcKvkvOpnFOeo+HIKbIJWXfM89SfH5TLdyFIhYjkPjJMhysiViGHFicqE1cQUa2w==
X-Received: by 2002:a19:4346:0:b0:4ef:ed49:fcc2 with SMTP id m6-20020a194346000000b004efed49fcc2mr1644201lfj.26.1690389943934;
        Wed, 26 Jul 2023 09:45:43 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id w23-20020a19c517000000b004fba82dde47sm3417465lfe.123.2023.07.26.09.45.42
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 09:45:43 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4fe0fe622c3so1599348e87.2
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 09:45:42 -0700 (PDT)
X-Received: by 2002:a05:6512:3b8:b0:4f4:c6ab:f119 with SMTP id
 v24-20020a05651203b800b004f4c6abf119mr1714334lfp.64.1690389942453; Wed, 26
 Jul 2023 09:45:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230726151515.1650519-1-kuba@kernel.org> <11ec5b3819ff17c7013348b766eab571eee5ca96.camel@perches.com>
 <20230726092312.799503d6@kernel.org>
In-Reply-To: <20230726092312.799503d6@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 26 Jul 2023 09:45:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjEj2fGiaQXrYUZu65EPdgbGEAEMzch8LTtiUp6UveRCw@mail.gmail.com>
Message-ID: <CAHk-=wjEj2fGiaQXrYUZu65EPdgbGEAEMzch8LTtiUp6UveRCw@mail.gmail.com>
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

On Wed, 26 Jul 2023 at 09:23, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Wed, 26 Jul 2023 08:43:30 -0700 Joe Perches wrote:
> > > Print a warning when someone tries to use -f and remove
> > > the "auto-guessing" of file paths.
> >
> > Nack on that bit.
> > My recollection is it's Linus' preferred mechanism.
>
> Let Linus speak for himself, hopefully he's okay with throwing
> in the -f.

It's not the '-f' that would be the problem - that's how the script
used to work long ago, and I still occasionally end up adding the -f
by habit.

So removing the auto-guessing of file paths wouldn't be a problem.

But the annoying warning is wrong.

I use get_maintainers all the time, and I *only* use it for file
paths. If I know the commit, I get the list of people from the commit
itself, so why should I *ever* use that script if I have a patch?

So the whole "use of get_maintainers is only for patches, and we
should warn about file paths" is insane.

No. If I get that patch, I will remove the warning. The *only* reason
for me to ever use that script is for the file path lookup.

             Linus
