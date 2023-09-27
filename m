Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33508E80A93
	for <workflows@archiver.kernel.org>; Wed, 27 Sep 2023 06:46:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbjI0Gqt (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 27 Sep 2023 02:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbjI0Gqs (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 27 Sep 2023 02:46:48 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E17510A
        for <workflows@vger.kernel.org>; Tue, 26 Sep 2023 23:46:44 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5046bf37ec1so7330188e87.1
        for <workflows@vger.kernel.org>; Tue, 26 Sep 2023 23:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695797203; x=1696402003; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqgmtzUwVMXQljcEBuFUtjGd5XOCZ/3np4UYnKXu4pk=;
        b=tcUr6fmmIrMvCb9goCuY7Y7/4qehnjyS7YopL7wKREehvNQHO8MlW09T8X9C5CMGGR
         3mvoxJxQDPXo21mrl5rD8jwOYH1ebnGuSHzs50nGupqlHP6BeLxFNJk6kYMQPJ23BaL1
         cZsx8Keq2iFYgKJijKxtxhHbZ9D9aDmM5tMY6mj9bWwCYYTys3B4kJaTTA37yBvR/urM
         mhS9TDPUSjKtdD7dVfbKk5C9RFwtov1inN+tOBhzysQi8t+gtXbIC5qoCnPX/6Nh5Gb1
         bNLwlhNLtRsLXN8o79z5fQsjdiusozoFqBFlgEXUrm7YTtFzAQGrCI/p3Kszc0O0Q6/G
         mvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695797203; x=1696402003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gqgmtzUwVMXQljcEBuFUtjGd5XOCZ/3np4UYnKXu4pk=;
        b=mr20KZc5gKPK/nBtkGpaFX1dAwq4x54IgLxTIf8CSJS+Oy9nslegug17kqCYvfoMR5
         OBnhnrCm372lLqlwcI1EinDoOyzteAV2dth0lUmrHUWH+gVfExnOorwfuj6CnkVWAE4g
         Nn+5O9X8lsU6y/tj6htqjJyEwKhjU/XS72JUrYImYhYxCjvhGnoMDYDzmIrL7juI1bmg
         exkPmXzkE9Ltfo3pG6jTBWRguJFg4aUJPAUaJXFfqkvmSQvtshhgiQT9whg201oCJDh2
         avdhagcnJx4fY8U8PyQhCN0qHelHrMN+f1DokBI7c5ud7qJcNlgDJUI0blQUhOoefDC7
         nfmQ==
X-Gm-Message-State: AOJu0YzHiJPlDDJOC0c48/zJ7yBGNIyDTjGjqmTK58kpHhMRPi0TO6dh
        FvrocPtHhVgvhBfJZ8KEp+eIA/NRhwrIxHsR70fenA==
X-Google-Smtp-Source: AGHT+IFFF5izbNKGb5lX7zFsym8oaDDP8QRH2c8xfWSygp4yaOul6c7TXvdgTha4FS+sCtZVuUn0Xv1fzmWcoaYW4Ic=
X-Received: by 2002:a19:5e55:0:b0:503:985:92c4 with SMTP id
 z21-20020a195e55000000b00503098592c4mr852305lfi.52.1695797202582; Tue, 26 Sep
 2023 23:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230927-get_maintainer_add_d-v1-0-28c207229e72@google.com>
 <20230927-get_maintainer_add_d-v1-3-28c207229e72@google.com> <2023092713-music-democrat-cea3@gregkh>
In-Reply-To: <2023092713-music-democrat-cea3@gregkh>
From:   Justin Stitt <justinstitt@google.com>
Date:   Wed, 27 Sep 2023 15:46:30 +0900
Message-ID: <CAFhGd8rJ=-SVB2NLhjoHbpHS-3ar0g0qT0LY4YTakp8eD83s7Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] get_maintainer: add patch-only pattern matching type
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, workflows@vger.kernel.org,
        mario.limonciello@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Sep 27, 2023 at 3:14=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Sep 27, 2023 at 03:19:16AM +0000, Justin Stitt wrote:
> > Note that folks really shouldn't be using get_maintainer on tree files
> > anyways [1].
>
> That's not true, Linus and I use it on a daily basis this way, it's part
> of our normal workflow, AND the workflow of the kernel security team.
>
> So please don't take that valid use-case away from us.

Fair. I'm on the side of keeping the "K:'' behavior the way it is and
that's why I'm proposing adding "D:" to provide a more granular
content matching type operating strictly on patches. It's purely
opt-in.

The patch I linked mentioned steering folks away from using
tree files but not necessarily removing the behavior.

>
> thanks,
>
> greg k-h

Thanks
Justin
