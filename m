Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DAE8E82CAA
	for <workflows@archiver.kernel.org>; Wed, 27 Sep 2023 16:01:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbjI0QBn (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 27 Sep 2023 12:01:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbjI0QBn (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 27 Sep 2023 12:01:43 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E04FA136
        for <workflows@vger.kernel.org>; Wed, 27 Sep 2023 09:01:40 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c62d61dc96so34909135ad.0
        for <workflows@vger.kernel.org>; Wed, 27 Sep 2023 09:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695830500; x=1696435300; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n15H0FheNa3mqwmWOOLwdjuLknHFCZpBdaYFxw9dy2I=;
        b=Gvj/rZAPooCRMXaXBC7k1XyqIv+TVI2aYApHIVeH3g4ip/PdkFuSS2fJ17G+xfZSqz
         PL3QeXSmn6Nr3EoZ/FXYvd/e8TGrTucVSO9a2bBJNj7nbYtJpgzFuHplewIgxNs8L8HU
         Z3S50JwcjkTVdZsrQOvFSy/0xQ3k+noV1Zfso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695830500; x=1696435300;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n15H0FheNa3mqwmWOOLwdjuLknHFCZpBdaYFxw9dy2I=;
        b=IYuTvg9sFezLlTUTIGOFEtt3RGI2UiMPi3T9Qu9qevqn9IHRpn7WCZ6eg2udE6CXyQ
         JRx532jCvX8WyfIRKVMMG5FqV5oBXaeSv0o2+OMmjG5iMi9dLjb0GLn06r/FipcgZmgJ
         tDzNC1fOlFsetuH+TI8c0H82F+LCDh0JJxu+H53ibIbwT3R74E18mxHvdMDd7+6ziKzY
         IdR9gzvqhN0VA44ZjfZZvnFG9DE0BS+peK5+hjmDWvGXgPFYARAjoDD9jnU1OpaZzAsj
         QJTWZu597XdOqQlR42mF71y6vGo251UnL0l1OVvrxKwNv+Oq4m/nVXuZh48Nflg829ah
         aE6g==
X-Gm-Message-State: AOJu0YyC+8/7dFT9K0h4C4NbyoYMHsgSObZ+Dcp75NbvpoE1l1Zp6lAC
        hPxDmm+yMOoe40MN8t6XxK1Dhg==
X-Google-Smtp-Source: AGHT+IGrBR+utDzRL8afQeGJmUYEVj5u/kadJGYYsKrk0xcLszK9da5IGy/cQqmOdKo3WGrF094bUw==
X-Received: by 2002:a17:902:c14c:b0:1c5:bcdf:fe93 with SMTP id 12-20020a170902c14c00b001c5bcdffe93mr2094485plj.27.1695830500304;
        Wed, 27 Sep 2023 09:01:40 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id i3-20020a170902c94300b001c6092d35b9sm8399659pla.85.2023.09.27.09.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 09:01:39 -0700 (PDT)
Date:   Wed, 27 Sep 2023 09:01:38 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Justin Stitt <justinstitt@google.com>,
        Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        workflows@vger.kernel.org, mario.limonciello@amd.com
Subject: Re: [PATCH 0/3] get_maintainer: add patch-only keyword matching
Message-ID: <202309270859.B83F72E179@keescook>
References: <20230927-get_maintainer_add_d-v1-0-28c207229e72@google.com>
 <CAKwvOdn4wwaBYzddLuXunjvCyH7HU8Brds-ZCYzsSxsAg4275Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdn4wwaBYzddLuXunjvCyH7HU8Brds-ZCYzsSxsAg4275Q@mail.gmail.com>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Sep 27, 2023 at 08:24:58AM -0700, Nick Desaulniers wrote:
> On Tue, Sep 26, 2023 at 8:19 PM Justin Stitt <justinstitt@google.com> wrote:
> >
> > This series aims to add "D:" which behaves exactly the same as "K:" but
> > works only on patch files.
> >
> > The goal of this is to reduce noise when folks use get_maintainer on
> > tree files as opposed to patches. This use case should be steered away
> > from [1] but "D:" should help maintainers reduce noise in their inboxes
> > regardless, especially when matching omnipresent keywords like [2]. In
> > the event of [2] Kees would be to/cc'd from folks running get_maintainer
> > on _any_ file containing "__counted_by". The number of these files is
> > rising and I fear for his inbox as his goal, as I understand it, is to
> > simply monitor the introduction of new __counted_by annotations to
> > ensure accurate semantics.
> 
> Something like this (whether this series or a different approach)
> would be helpful to me as well; we use K: to get cc'ed on patches
> mentioning clang or llvm, but our ML also then ends up getting cc'ed
> on every follow up patch to most files.
> 
> This is causing excessive posts on our ML. As a result, it's a
> struggle to get folks to cc themselves to the ML, which puts the code
> review burden on fewer people.
> 
> Whether it's a new D: or refinement to the behavior of K:, I applaud
> the effort.  Hopefully we can find an approach that works for
> everyone.

Yes, please! I would use this immediately -- there are a bunch of places
where pstore, strings, hardening, etc all want review if certain
functions or structures are changed in a patch, but we're not
maintainers of the files they appear in.

> > Justin Stitt (3):
> >       MAINTAINERS: add documentation for D:
> >       get_maintainer: add patch-only pattern matching type

Can we squash these two changes together, and then likely add some
patches for moving things out of K: ?

-- 
Kees Cook
