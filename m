Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D07BC433FE
	for <workflows@archiver.kernel.org>; Thu, 29 Sep 2022 13:53:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235336AbiI2Nxa (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 29 Sep 2022 09:53:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233587AbiI2Nxa (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 29 Sep 2022 09:53:30 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B70B014DACB
        for <workflows@vger.kernel.org>; Thu, 29 Sep 2022 06:53:28 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id cj27so778258qtb.7
        for <workflows@vger.kernel.org>; Thu, 29 Sep 2022 06:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=NFq9wRsaoLbh4oQSllJvLMyhItK0hN2kyKyyofhotcc=;
        b=GzIoyl2hCGKjHugwH/XcQsFFJdGgIazGUTKz5gDoY+qt57jLvFx9O9comYjzZVSGzp
         ypLtpW3zMWHTksKoYY5zkGCtPy3w19IaR7JMgQI2qhhjI32JC66LDQL4qCAy031Nlg5d
         F9KtvlQFUUbR8VZBe060JNviDDHZOzZj0ZTWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=NFq9wRsaoLbh4oQSllJvLMyhItK0hN2kyKyyofhotcc=;
        b=g9LO5Ci8whOThDhgGUy6DYjajw6jGjPR0WPqFPpz98SRUaEAMn5YS7gQQ93A5GSQ8S
         VmfSAng9nhRvK9c+FrCAG2WPB73CLDl+vFaWDndojn2za3IqplOScw9cuU+EMzT6cte/
         U9JVXTIZ1OFEuoXrUBEUcpzTafd/78vTCJT0RuMjCGs18doAnqRv/JlV/rZIBzbm/UAQ
         zZWGBLR2J2nYulw3eW3D91OQtRzL0IpYwdqQH8HWszOGQq3QIQ+4j3TSNmPbpUn0amZ7
         wUqzsT+BtcgVakvfNVN5uhAXYdyjxfsmtbd/8IMmuzRTvOHHuvzYC21Nl1nu+xUTWYPi
         es+g==
X-Gm-Message-State: ACrzQf2Fedzgq+e/UDHUkQqb2bLSXyJGP4jLH+1K8vYMmAxpMKfqCjCJ
        qBiicZdDL/7AHILrX/eeF+/yDA==
X-Google-Smtp-Source: AMsMyM5T9J57qBDA1T39F0nfFp2aG/oapSlPbrCYqhZrKg51/H+00u4UHzZRnUmBo2c8a0wOv0/YwA==
X-Received: by 2002:a05:622a:390:b0:35d:44ab:c615 with SMTP id j16-20020a05622a039000b0035d44abc615mr2459020qtx.594.1664459607829;
        Thu, 29 Sep 2022 06:53:27 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id bq35-20020a05620a46a300b006bb78d095c5sm6087519qkb.79.2022.09.29.06.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 06:53:27 -0700 (PDT)
Date:   Thu, 29 Sep 2022 09:53:25 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     "Artem S. Tashkinov" <aros@gmx.com>
Cc:     Thorsten Leemhuis <linux@leemhuis.info>, workflows@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        ksummit@lists.linux.dev
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <20220929135325.4riz4ijva2vc7q5p@meerkat.local>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
 <93a37d72-9a88-2eec-5125-9db3d67f5b65@gmx.com>
 <20220929130410.hxtmwmoogzkwcey7@meerkat.local>
 <7b427b41-9446-063d-3161-e43eb2e353f9@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7b427b41-9446-063d-3161-e43eb2e353f9@gmx.com>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Sep 29, 2022 at 01:31:49PM +0000, Artem S. Tashkinov wrote:
> To me it sounds like the best way to keep moving forward is simply
> convert git.kernel.org + patchwork.kernel.org + bugzilla to
> gitlab.kernel.org and that will solve all the issues immediately.

No, you will still have all the exact same problems as long as nobody is in
charge of handling incoming bugs. There are plenty of active github/gitlab
projects with thousands of open issues that nobody is working on for the exact
same reason nobody is working on bugs filed via bugzilla -- the right people
didn't see it (or are actively ignoring it, because they are working on
something else).

> That will require of course a ton of work but:
> 
> 1) All the commiters will be automatically present and you can easily CC
>    them

Just like with bugzilla.

> 2) All the kernel directories could be split into components with the
>    respective developers being subscribed to them automatically. There's an
>    issue though: sometimes directories/components are rearranged. Gitlab
>    however is quite powerful, so issues can be easily moved between
>    components.

Just like bugzilla.

> 3) It's gonna be a ton easier to keep track of commits and discuss/review
>    them. AFAIK it's now done using LKML + patchwork.kernel.org and then
>    commits are merged by maintainers. So many places to keep track of.

Now there will be a single place someone can knock out to stop all kernel
development and coordination, subject to countrywide IP blocks, political
influence, etc.

Besides, maintainers already have a single place to keep track of things --
their inbox. If they didn't see something in their inbox, how is it going to
be different when it's a web interface?

> 4) Gitlab probably can be integrated with other gitlabs (at least AMD, Intel
>    and Nouveau drivers are developed on gitlab.freedesktop.org).
> 
> Gitlab simplifies all of that tremendously. Github will work as well but I
> know many people don't like it.

Gitlab is also a commercial open-core project. It is permanently in danger of
being swallowed by some $ENTITY_NOBODY_LIKES, who will for sure look to
prioritize what kinds of things go in to the "open core" part and what kinds
of things are only available with subscription, in order to improve profit
margins.

-K
