Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D800C433F5
	for <workflows@archiver.kernel.org>; Tue,  4 Oct 2022 20:25:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbiJDUZs (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 4 Oct 2022 16:25:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbiJDUZq (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 4 Oct 2022 16:25:46 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55C446BCCB
        for <workflows@vger.kernel.org>; Tue,  4 Oct 2022 13:25:43 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id g2so9106323qkk.1
        for <workflows@vger.kernel.org>; Tue, 04 Oct 2022 13:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=DGvJV2IIUZV7S3zU1Gd//TygTt/OG32AqXy+s65/XH0=;
        b=CQ6jzxz7pGsi/7Unxn/3myaDbDXR9ldixRssga58u32qNXAC6JjOpSI/qeMcu/HIUX
         EFZKLfcJkGHxiZasUc+40u8aAkxk+iPZVw4KCaeyTry2PMcmjVKojL9rrmRNk8Lg44fu
         YRxoeUmyTDJiq+KqrgkkWv23G0AOM3RM/FsI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=DGvJV2IIUZV7S3zU1Gd//TygTt/OG32AqXy+s65/XH0=;
        b=Md2FY+DXP4r2NkO7s6G54rWP2Wl/ah2Kjfl9+RNlgyJhsTPEfZos9ssw2ZTCkLEiVS
         iMJ+2r+bsHhnPsVGJ08zBtg/o3TAoxgwcI8+rs1OuZe08JTf+o/a80uk3AfVyeKmAcQr
         e6V6MGQ8Hg8xVdoH1Rkz3IR92l5Tc5u5t15veueC3I6ywzSSC0VYtQj7emkqe3uX/t4e
         dGh11yqb8vAiT4dBmJxYlvtUqhWF73HieXsZG319LyJJLKWViGVnRQ8J4lQhGrnRXQlW
         cI8MKh6uBxcQQEZT0QJWlB9zDTESlKz8GSSC9sC38IvLU+AmYV4lseg4SrpiVUnfprcm
         +E9w==
X-Gm-Message-State: ACrzQf0jJWssZkHm6jkgw5yYluL7zVBRXXdLo/OT6BGGLFb52LHGTABK
        Y7/NSzyxhKfZQDk8BbUNyYy3KQ==
X-Google-Smtp-Source: AMsMyM5g235+vx6KmW0J4fCOEYlimbuJcIi/EoLRom6zkxz2Hs63d2hk+LFSJ/eSNDEQQfP6UjUKNQ==
X-Received: by 2002:a05:620a:12f5:b0:6ce:742c:b0d0 with SMTP id f21-20020a05620a12f500b006ce742cb0d0mr17910376qkl.19.1664915142362;
        Tue, 04 Oct 2022 13:25:42 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id bp37-20020a05620a45a500b006ce7bb8518bsm15160606qkb.5.2022.10.04.13.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 13:25:42 -0700 (PDT)
Date:   Tue, 4 Oct 2022 16:25:40 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     "Artem S. Tashkinov" <aros@gmx.com>,
        ksummit <ksummit@lists.linux.dev>, workflows@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <20221004202540.etokkm3jk6sk7z7y@meerkat.local>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <20221004175354.bfvg3vhfqch35ib5@meerkat.local>
 <c74d9d75-4428-e22d-1adb-334b1173d871@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c74d9d75-4428-e22d-1adb-334b1173d871@leemhuis.info>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Oct 04, 2022 at 10:06:28PM +0200, Thorsten Leemhuis wrote:
> Your plan would afaics mean that we invest further into a software
> abandoned by its upstream and already becoming more and more of a
> maintenance burden. That investment would also further increase our
> dependency on that software by establishing workflows that rely on it.
> Is that really wise at this point? Wouldn't it be better to spend that
> time and effort to build something better that is more future proof?

Unfortunately, there's no such thing. ;) And maybe we'll even help tip the
course of history into the other direction -- Red Hat uses bugzilla, and so
does OpenSuse, so there's a pretty good core of well-funded companies that
would be in a position to help keep bugzilla going if it's looking like the
platform is still alive. Or that could all be wishful thinking and they'll all
migrate to Jira or something equally horrible, who knows.

I'm hoping that by keeping the bulk of this exchange relying on established
decentralized end-to-end messaging, we won't be painting ourselves into the
corner quite as much as with a tool that requires all interaction to happen
strictly via the web interface.

The alternative is to hire the folks behind patchwork to write "bugwork".

-K
