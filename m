Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B2AC2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 15:46:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1D6661405
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 15:46:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232371AbhFQPsb (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 11:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbhFQPsb (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Jun 2021 11:48:31 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5360BC061574
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 08:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=ZOiz25qkRMmdEkdqZhQZcJIFLobjdvDZqxxJb+BDWJQ=; b=PBkw/aqYsecB5Z8gZhAOYonN3c
        8GEg0wuGClMGlfYusi7iEOdaRfAIx++i/mM1lT3t4GWqS4RfCjJu3tZ0jt7jPmcwJSOUPxME2o5Oe
        3C1ajNRpj9dl4W5CK6perGlEDSrMYth9K80p6k7P5XUOwQRlPlBeiyxB8h/vkIJObHOlhyiKNyonl
        j7YOGoscbHksWmFZ+LfPhJm+BF7Z++42aQ2+lqkwFtcnNjI0taS0TXdipwblo1TnQdx36y+yxC3WH
        eild+yNm3Pvv6qu4qQwV3WAo6SrIT48Q20qoXgFTn1WD/TdVkhum4jx702ekuaJra8d/JVOq9dmUo
        CY9//4nw==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1ltuCu-009IOI-It; Thu, 17 Jun 2021 15:45:30 +0000
Date:   Thu, 17 Jun 2021 16:45:28 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        users@linux.kernel.org, workflows@vger.kernel.org
Subject: Re: RFC: Github PR bot questions
Message-ID: <YMtuGBQLBht0W/68@infradead.org>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
 <CAL_JsqLMPnCpEHpbj_=LDQNU9+sq5oFrmSxngdiWNR3XOhtc_Q@mail.gmail.com>
 <20210617085251.78d376d7@coco.lan>
 <CACT4Y+bJNuPV2sXtGn+v0PcNP+6uFO7GdmW9XL4pQMF_vokmhg@mail.gmail.com>
 <20210617105534.0d4c02df@coco.lan>
 <CAL_JsqJNriy1HwY-A-4Qczt-MNvMh0zOvWhvd0DAX3EHm6hhNw@mail.gmail.com>
 <20210617172450.05f91115@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617172450.05f91115@coco.lan>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Jun 17, 2021 at 05:24:50PM +0200, Mauro Carvalho Chehab wrote:
> > > A change like that would touch lots of subsystems, making get_maintainer.pl
> > > to spend a lot of time processing it, and producing thousands of
> > > entries (btw, we had a change somewhat similar to the above a long time
> > > ago when mutex API was introduced and most of the semaphores were converted
> > > to use mutex kAPI instead).  
> > 
> > What I end up doing in those cases is only Cc'ing the subsystem
> > maintainers. But that's a manual step of dropping all the driver and
> > SoC maintainers.
> 
> Yeah, surely it would be a lot better if the maintainer's file would
> have a way to distinguish between driver and subsystem maintainers.

Well, the problem here is really that get_mainters is broken and things
anyone touching a file would care about future patches.  Right now the
only workaround for that is to get yourself added to
.get_maintainer.ignore.

The actual MAINTAINERS file processing issues are minor compared
to that.  One thing that I'd love is a way to express that yes, there
are maintainers, and no you should not Cc them but just send the
patches to the list.  Maybe even with a core files vs drivers split
as suggested by you above.  But compared to the messed up git
heuristics that is pretty much a minor issue.
