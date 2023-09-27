Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB09E82CA1
	for <workflows@archiver.kernel.org>; Wed, 27 Sep 2023 15:25:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232055AbjI0PZW (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 27 Sep 2023 11:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232184AbjI0PZQ (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 27 Sep 2023 11:25:16 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66EF8139
        for <workflows@vger.kernel.org>; Wed, 27 Sep 2023 08:25:13 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4056ce55e7eso81795765e9.2
        for <workflows@vger.kernel.org>; Wed, 27 Sep 2023 08:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695828312; x=1696433112; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5nq0AynO1Yzw1bZ8ZiP7ugYjLWSQDb+tbYguvApLxfI=;
        b=vPEUx6JkC1BUOH/hFn1moimymhyBE64EZJ9WGatvs2YCEMbIP9dIZtUxyqrFFwpQCK
         0BhAPKxehEkwOUFTAJC3xAdTYdZwb992ZhZXBg5amC4HcS8YQQAetpHudWwLbSIZArT1
         YR65XrHQmj8DPWls18/PQ9lr9JgZY74qLYRLlv2dVrsvMRBHqGu5fKlNeWuWqnk65C2W
         TeqfLUoXGWeyIIcj/boLVaO7U0e86qKBSuTzA1XJOaCcpeoLILZysQ1iXxy/5AAgg1A3
         Rk5S8jsrKT+9vQAGve2o9oEunGRfWOgPm0JW7KIX8RcEx/+gF2etSBfJXbGB7yX0ZIGb
         0wwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695828312; x=1696433112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5nq0AynO1Yzw1bZ8ZiP7ugYjLWSQDb+tbYguvApLxfI=;
        b=hpNYeQ3hN/U6cWMSpzWXLCTVjxCktFXxURzqRVoBZGNgm2uidNWri6ob1VhPtoVGHn
         onyILIF161BNcCUqL+LtUljbWRG8qjg08Qhb0IjLWRWmUX3dRIQ8tBselVWoz2Ai3d/l
         594q1Cf0lDEap5w752xtbcYW/2j9ZM6fvczihPGXz06qIh/kcAuH6Sb8DIkJayySc5QU
         fgBmjSz8P84XfC9v0Pm7PRb6BUJU3NqLtW4RuF4e4fHzY+VYQVHgpeDEftH05VtlEbho
         L31VOiBqER1fifjZqkZmmreZlupkOXHBtFrZk7GMC3bqNYDEXcxHKOYYECko6KbPAFKU
         c5xw==
X-Gm-Message-State: AOJu0YyZMW62G6BylbawD0vpXWeg8lIl6872NE583IfeAxe9fYwtCvbs
        VGnLN+JabVNr7G6BkPq2YLHXpRLLR/PjR1MaHXBxUw==
X-Google-Smtp-Source: AGHT+IF6Ya4C0MpdWae/8BDGC/fmpbjiR3qySB2ktTN5Y5Zph8oWEcxWteV31ZmtJTV6esBhTQyx575PrVz+8C4y1Hg=
X-Received: by 2002:a5d:5704:0:b0:31f:e759:d687 with SMTP id
 a4-20020a5d5704000000b0031fe759d687mr1995001wrv.50.1695828311576; Wed, 27 Sep
 2023 08:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230927-get_maintainer_add_d-v1-0-28c207229e72@google.com>
In-Reply-To: <20230927-get_maintainer_add_d-v1-0-28c207229e72@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 27 Sep 2023 08:24:58 -0700
Message-ID: <CAKwvOdn4wwaBYzddLuXunjvCyH7HU8Brds-ZCYzsSxsAg4275Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] get_maintainer: add patch-only keyword matching
To:     Justin Stitt <justinstitt@google.com>
Cc:     Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        workflows@vger.kernel.org, mario.limonciello@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Sep 26, 2023 at 8:19=E2=80=AFPM Justin Stitt <justinstitt@google.co=
m> wrote:
>
> This series aims to add "D:" which behaves exactly the same as "K:" but
> works only on patch files.
>
> The goal of this is to reduce noise when folks use get_maintainer on
> tree files as opposed to patches. This use case should be steered away
> from [1] but "D:" should help maintainers reduce noise in their inboxes
> regardless, especially when matching omnipresent keywords like [2]. In
> the event of [2] Kees would be to/cc'd from folks running get_maintainer
> on _any_ file containing "__counted_by". The number of these files is
> rising and I fear for his inbox as his goal, as I understand it, is to
> simply monitor the introduction of new __counted_by annotations to
> ensure accurate semantics.

Something like this (whether this series or a different approach)
would be helpful to me as well; we use K: to get cc'ed on patches
mentioning clang or llvm, but our ML also then ends up getting cc'ed
on every follow up patch to most files.

This is causing excessive posts on our ML. As a result, it's a
struggle to get folks to cc themselves to the ML, which puts the code
review burden on fewer people.

Whether it's a new D: or refinement to the behavior of K:, I applaud
the effort.  Hopefully we can find an approach that works for
everyone.

And may God have mercy on your soul for having to touch that much perl. :-P

>
> See [3/3] for an illustrative example.
>
> This series also includes a formatting pass over get_maintainer because
> I personally found it difficult to parse with the human eye.
>
> [1]: https://lore.kernel.org/all/20230726151515.1650519-1-kuba@kernel.org=
/
> [2]: https://lore.kernel.org/all/20230925172037.work.853-kees@kernel.org/
>
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Justin Stitt (3):
>       MAINTAINERS: add documentation for D:
>       get_maintainer: run perltidy
>       get_maintainer: add patch-only pattern matching type
>
>  MAINTAINERS               |    3 +
>  scripts/get_maintainer.pl | 3334 +++++++++++++++++++++++----------------=
------
>  2 files changed, 1718 insertions(+), 1619 deletions(-)
> ---
> base-commit: 6465e260f48790807eef06b583b38ca9789b6072
> change-id: 20230926-get_maintainer_add_d-07424a814e72
>
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
>


--=20
Thanks,
~Nick Desaulniers
