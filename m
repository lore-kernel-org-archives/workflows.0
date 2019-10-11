Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CA1C4360C
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 02:16:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3803521D6C
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 02:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570760217;
	bh=5lPeDqIXEOFCQZnm/M/0kWRPw1GOQJOP67Jr3Dpi014=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=EQlWdWTV9wJb8tBRmeOtPANHlyVsLqOei8xljTw/pO4MoQlXeq2mLMjxQhg4H31Nx
	 K2VEe522H5MqLDoudCG7hDfYb4XOltRXwBJl5dRAemEiHt/uaeDwipBoqS0AIhI1dl
	 +bIoVQgxv/80/fh6D5uqGjpRyOpLxYTvHdGQbCSM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727969AbfJKCQ4 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 10 Oct 2019 22:16:56 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:39136 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727369AbfJKCQ4 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 10 Oct 2019 22:16:56 -0400
Received: by mail-qk1-f194.google.com with SMTP id 4so7528510qki.6
        for <workflows@vger.kernel.org>; Thu, 10 Oct 2019 19:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5lPeDqIXEOFCQZnm/M/0kWRPw1GOQJOP67Jr3Dpi014=;
        b=g9O6r/VwdvQYKeHYL8eCvfXWxJOWF8ZYk9gLy5cVUR1n2FL6RCofHeAOHlPHyNaZ+x
         vcpcclCEfA59/adYWA57zlg2wku2c3cENnEXs+GODdg1zujE3aFPQ2+UAmhPKdfP3evI
         FpTrAP4pPXMZIA1UxeqNF3aAhBW7E3srl/XVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5lPeDqIXEOFCQZnm/M/0kWRPw1GOQJOP67Jr3Dpi014=;
        b=Z0C+bG+Mudy5g8Edw9Vo2fx1u6XeP2YPV/tYG1eHWfrtqLPdx0Xm66vC8vBzO9g+bq
         BjTqZk64PYFmGQ+dipKfWEJK1rDX2wFj9C8Kq28Wa6ueye8gFflXCSDC3zyJar6IW6RN
         zKuZFC3+BqhVUwyqYzz7AfR3spPWwiq5mJ9EJgQ0AFQC2Nx4aLUELL20gM0OvQeavdhr
         9jh3cAEJp7IjtAGtIRMWTduY4Wrc301byOqKN7iHbrjV63MDIpv1ONM+5XS1cGa7fyfs
         BhbHVU1To42HrFlXOfy2J2FW073QTl0f9tnIXyHyRs1IXSljAqy3IckXSDoOngk0u8ym
         wllw==
X-Gm-Message-State: APjAAAUm/Dzi7Hh4yIJ70OkNbS3LuKUIlgQvhrxOr9I6meWoWMwD0jcM
        BJ+PgCnomsED5MPnkXFnzikLcEbGURNNioH0H6fK1w==
X-Google-Smtp-Source: APXvYqwyLxjf/XRbHXZNJmYDGlrXJrlerEUnbjFbF4PiPpmQMPrDY9PMeQSI7qSWKcELYCFfWaBrrzZJz33fu+GH11g=
X-Received: by 2002:a37:9d0e:: with SMTP id g14mr13382457qke.369.1570760215474;
 Thu, 10 Oct 2019 19:16:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190912120602.GC29277@pure.paranoia.local> <d6e8f49e93ece6f208e806ece2aa85b4971f3d17.1569152718.git.dvyukov@google.com>
 <20190930202451.GA14403@pure.paranoia.local> <CACT4Y+a9VXYF3N__Bw52RPhVhXc4B6hT7Hdpjn=wk_qzhgJZ8Q@mail.gmail.com>
 <20191008165155.GA30571@chatter.i7.local>
In-Reply-To: <20191008165155.GA30571@chatter.i7.local>
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date:   Thu, 10 Oct 2019 22:16:42 -0400
Message-ID: <CAMwyc-TzGj4BE0E2tRn8Esj43SnpcWXpS-ureG1YWbmtzmfqbA@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Reflections on kernel development processes
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Dmitry Vyukov <dvyukov@gmail.com>, "Theodore Ts'o" <tytso@mit.edu>,
        Rob Herring <robh@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        stefan@datenfreihafen.org, Sasha Levin <sashal@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, 8 Oct 2019 at 12:51, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> >Hi Konstantin,
> >
> >Are you going to attend OSS Summit EU? If yes, I think we should sync
> >up there. I know Dave and Greg are there too. Perhaps we could
> >schedule some kind of semi-formal meeting?
>
> Unfortunately, no -- we have limited budget for traveling and I burned
> through mine by going to Lisbon. I'd be happy to work on a draft
> document that expands on my tooling vision (I'm doing so anyway), and I
> can time it to be ready before the summit so you can review and improve
> it. My hope is to submit it formally to the LF by the end of the month.

Oh, hey, change of plans -- looks like I *will* be going to Lyon after
all. I think sitting down together for a semi-formal meeting sounds
like a good idea, considering all the active discussions happening
lately. Should we hash out a tentative agenda about topics that we
should and shouldn't cover? Who should be in attendance?

Best Regards,
--=20
Konstantin Ryabitsev
Director, Projects IT
The Linux Foundation
Montr=C3=A9al, Qu=C3=A9bec
