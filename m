Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E99C7EE24
	for <workflows@archiver.kernel.org>; Fri,  5 May 2023 19:39:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233409AbjEETjs (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 5 May 2023 15:39:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233262AbjEETjp (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 5 May 2023 15:39:45 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B3AE2127
        for <workflows@vger.kernel.org>; Fri,  5 May 2023 12:39:41 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-61aecee26feso10442616d6.2
        for <workflows@vger.kernel.org>; Fri, 05 May 2023 12:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683315580; x=1685907580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6BqLpqsqpfv4e6MRMY7gBjrDbHLmMrEtwfllMgszTw=;
        b=OjZbBTcfGOQAnlSXtPwCAuc+ky8ALtIYzA9WpYBwiKNrPvoibiC3t0jK3gh8lkyHCV
         I7PqXmoVMTlkgVny0PKfZnI2bMDwQve5OkO2TDvJ/heMmyYd158XR5k5E4Yg8FlLyZIE
         jbsWZALi/50JOayWZBQHA0Mvr9ctCyv2fch9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683315580; x=1685907580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6BqLpqsqpfv4e6MRMY7gBjrDbHLmMrEtwfllMgszTw=;
        b=HXP+eyk28nnpFKsQL2UiuQp0bIh6NVQgRtSmpckiE6u+c9rhp9FW7aCuWJCr2IjI7f
         CYZFqKdXEQ+jsqQ12/clhqUoOHMB3GBsaGfha/OdgazCNtIPtnO9GTE3+QhVfoBbMKnh
         jRAFXex2vtjn9XSSOlgxnkaGY/K0BRCqT8cnBjXdy/GvX6w1G5FSNBpVY8UmYxnNvw2b
         I3lNvevEK3ArAKdRYsatpXToHftVY2w/dVD/x3dzkbHuJnNHBt3O7sNbsRpfCyvhdQn/
         B2cOYvYK1G1nUzLhaSMwciSqcvw2qA5ldDewMa0jWJ4MD8jgnRfgW5On3/Zd6GF06NMc
         hBGw==
X-Gm-Message-State: AC+VfDx+EJ0k8fP9CKtCGw/pkEEA0oIZH3Un1SplTYUGBiiQCT4R9Y6Y
        ZAYoeIo1RPus5XTk8gOa5PN2kg==
X-Google-Smtp-Source: ACHHUZ4sL0e5LUqXusK8zAVq+1JZOQ9Ih7SpSisWHVue2HXLyx7MjYodDozdQjwiEDJ0GtrOJMx5gw==
X-Received: by 2002:a05:6214:5299:b0:61b:6fcd:34ab with SMTP id kj25-20020a056214529900b0061b6fcd34abmr3982129qvb.0.1683315580300;
        Fri, 05 May 2023 12:39:40 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id o16-20020a056214109000b0061b5ad0290asm808144qvr.67.2023.05.05.12.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 12:39:39 -0700 (PDT)
Date:   Fri, 5 May 2023 15:39:38 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     workflows@vger.kernel.org, aros@gmx.com,
        linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
        tools@linux.kernel.org, linux@leemhuis.info
Subject: Re: Introducing bugbot
Message-ID: <20230505-blunt-corncob-6e6e95@meerkat>
References: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q>
 <20230505085218.60c62d75@kernel.org>
 <20230505-lent-swoosh-4897e2@meerkat>
 <20230505123226.731d8ff8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230505123226.731d8ff8@kernel.org>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, May 05, 2023 at 12:32:26PM -0700, Jakub Kicinski wrote:
> Interesting. Obviously that assumes the bug needs a fix, and we're
> talking bugzilla so lots of clueless people lobbing non-issues at us.

This is why anyone can create a bug on bugzilla, but only a subset of people
can enable bugbot on it (by setting the bugbot+ flag).

> But also - Closes: is a legit trailer now? I thought we only allow Link:

It's a semi-legit trailer and is going through -next:
https://docs.kernel.org/next/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes

> In any case - I'm guessing I just don't have permissions to close the
> issues via web. Is your preference to iterate on the bot or maintainers
> to request permissions in BZ (how?)?

Yes, it's not a power granted by default, but people just need to ask.
You should have this awesome power now.

-K
