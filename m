Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB57BECE58C
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 13:29:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A08942053B
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 13:29:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O20786Fl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbfJKN30 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 09:29:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36608 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727589AbfJKN30 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 11 Oct 2019 09:29:26 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77A5433A;
        Fri, 11 Oct 2019 15:29:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1570800563;
        bh=RErRGfgaFhoPvNqcjiNS7z86i+RMLE0lT+GpKk6VMU4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O20786FlYt8r1iKX/U6hw7kdgYmPJYasSCfgowlt2J2/IiKao65pRx9Z7pWUN+d+f
         VPKK5QbNwxQ68pijJeZtEDPFde+ugHQo4KlGmaQOprwsfTR6jjwUzpErQZQS++cfiT
         yEOY8J6JkGISpaSDlS+2vYWSR35YeAPjDcYz/Yjg=
Date:   Fri, 11 Oct 2019 16:29:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Dmitry Vyukov <dvyukov@gmail.com>,
        Theodore Ts'o <tytso@mit.edu>, Rob Herring <robh@kernel.org>,
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
Subject: Re: [MAINTAINERS SUMMIT] Reflections on kernel development processes
Message-ID: <20191011132921.GF4882@pendragon.ideasonboard.com>
References: <20190912120602.GC29277@pure.paranoia.local>
 <d6e8f49e93ece6f208e806ece2aa85b4971f3d17.1569152718.git.dvyukov@google.com>
 <20190930202451.GA14403@pure.paranoia.local>
 <CACT4Y+a9VXYF3N__Bw52RPhVhXc4B6hT7Hdpjn=wk_qzhgJZ8Q@mail.gmail.com>
 <20191008165155.GA30571@chatter.i7.local>
 <CAMwyc-TzGj4BE0E2tRn8Esj43SnpcWXpS-ureG1YWbmtzmfqbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMwyc-TzGj4BE0E2tRn8Esj43SnpcWXpS-ureG1YWbmtzmfqbA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Konstantin,

On Thu, Oct 10, 2019 at 10:16:42PM -0400, Konstantin Ryabitsev wrote:
> On Tue, 8 Oct 2019 at 12:51, Konstantin Ryabitsev wrote:
> > > Hi Konstantin,
> > >
> > > Are you going to attend OSS Summit EU? If yes, I think we should sync
> > > up there. I know Dave and Greg are there too. Perhaps we could
> > > schedule some kind of semi-formal meeting?
> >
> > Unfortunately, no -- we have limited budget for traveling and I burned
> > through mine by going to Lisbon. I'd be happy to work on a draft
> > document that expands on my tooling vision (I'm doing so anyway), and I
> > can time it to be ready before the summit so you can review and improve
> > it. My hope is to submit it formally to the LF by the end of the month.
> 
> Oh, hey, change of plans -- looks like I *will* be going to Lyon after
> all. I think sitting down together for a semi-formal meeting sounds
> like a good idea, considering all the active discussions happening
> lately. Should we hash out a tentative agenda about topics that we
> should and shouldn't cover? Who should be in attendance?

I'll be there as well, and would like to attend if possible (assuming no
agenda clash).

Regarding the agenda, I think the most urgent task now is figuring out
what we want to achieve and find an as large as possible consensus. The
"centralisation resistance" movement is quite fragmented, leading to
little traction and a high level of doubt from third parties that we
would be able to achieve anything.

Crucial to test effort is, I believe, a need to acknowledge all the pain
experienced by developers and maintainers who are considering moving to
forges, and making sure we take into account their use cases.

I also would like to use that opportunity to discuss what we really mean
by "e-mail workflow". Many developers on this list have expressed a need
for an e-mail-compatible solution, and I really wonder if they meant
e-mail as such, or if e-mail is more of an umbrella term that summarises
the current advantages of e-mail that could also be provided by new
tools that we would develop.

-- 
Regards,

Laurent Pinchart
