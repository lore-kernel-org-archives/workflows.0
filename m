Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C7EC47404
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 08:31:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CBA8D2196E
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 08:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570782661;
	bh=NihTNBTNAbCkHgkPtnmEVEoRRmHi6bHKOy/oSH7EJHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=a5vWUK/usdICmDZiGykVgXNrwiPL1hwBP6gDsxj7qA4TFNv4YBwD7NL9RCgWycWFg
	 FxUWwWAqWtXPY8rvBeDbNHd9JHuvwJdH3D80WVe5yHCPyljQdV3m3W1AcDtDB07aTi
	 84DnEHvVEmPfZ4UjSN6Ar/+4n4woJQo4KhQtoAE8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbfJKIbB (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 04:31:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:50260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726535AbfJKIbB (ORCPT <rfc822;workflows@vger.kernel.org>);
        Fri, 11 Oct 2019 04:31:01 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0C41C20679;
        Fri, 11 Oct 2019 08:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570782660;
        bh=NihTNBTNAbCkHgkPtnmEVEoRRmHi6bHKOy/oSH7EJHk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LbITAUJJNUwvU5lqwAcGlsJgTiAHZWAas+r6O/C0CmXvOsrJwg2kFVuKdBRC7zCu+
         FwY3tN2ZHrI050R7UHo6nKG4+LhJLrQ8lmFBja4OWM5BHBdqC0bLZh+Wt3iY3w+/O8
         gn0TZbAWwJWvtOgS3lXSzejppPEECvQCpqsn4MpM=
Date:   Fri, 11 Oct 2019 10:30:57 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Dmitry Vyukov <dvyukov@gmail.com>,
        Theodore Ts'o <tytso@mit.edu>, Rob Herring <robh@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        stefan@datenfreihafen.org, Sasha Levin <sashal@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        David Miller <davem@davemloft.net>
Subject: Re: [MAINTAINERS SUMMIT] Reflections on kernel development processes
Message-ID: <20191011083057.GA1074413@kroah.com>
References: <20190912120602.GC29277@pure.paranoia.local>
 <d6e8f49e93ece6f208e806ece2aa85b4971f3d17.1569152718.git.dvyukov@google.com>
 <20190930202451.GA14403@pure.paranoia.local>
 <CACT4Y+a9VXYF3N__Bw52RPhVhXc4B6hT7Hdpjn=wk_qzhgJZ8Q@mail.gmail.com>
 <20191008165155.GA30571@chatter.i7.local>
 <CAMwyc-TzGj4BE0E2tRn8Esj43SnpcWXpS-ureG1YWbmtzmfqbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMwyc-TzGj4BE0E2tRn8Esj43SnpcWXpS-ureG1YWbmtzmfqbA@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Oct 10, 2019 at 10:16:42PM -0400, Konstantin Ryabitsev wrote:
> On Tue, 8 Oct 2019 at 12:51, Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> > >Hi Konstantin,
> > >
> > >Are you going to attend OSS Summit EU? If yes, I think we should sync
> > >up there. I know Dave and Greg are there too. Perhaps we could
> > >schedule some kind of semi-formal meeting?
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

I'd like to be there, as I will be at the conference.

thanks,

greg k-h
