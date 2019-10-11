Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C7BECE58C
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 13:52:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B57BA2064A
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 13:52:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728027AbfJKNwA (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 09:52:00 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:52148 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727950AbfJKNwA (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 11 Oct 2019 09:52:00 -0400
Received: from callcc.thunk.org (guestnat-104-132-34-105.corp.google.com [104.132.34.105] (may be forged))
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x9BDpRHf020552
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 11 Oct 2019 09:51:28 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id 3FF9C42045A; Fri, 11 Oct 2019 09:51:27 -0400 (EDT)
Date:   Fri, 11 Oct 2019 09:51:27 -0400
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Dmitry Vyukov <dvyukov@gmail.com>,
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
Subject: Re: [MAINTAINERS SUMMIT] Reflections on kernel development processes
Message-ID: <20191011135127.GD16225@mit.edu>
References: <20190912120602.GC29277@pure.paranoia.local>
 <d6e8f49e93ece6f208e806ece2aa85b4971f3d17.1569152718.git.dvyukov@google.com>
 <20190930202451.GA14403@pure.paranoia.local>
 <CACT4Y+a9VXYF3N__Bw52RPhVhXc4B6hT7Hdpjn=wk_qzhgJZ8Q@mail.gmail.com>
 <20191008165155.GA30571@chatter.i7.local>
 <CAMwyc-TzGj4BE0E2tRn8Esj43SnpcWXpS-ureG1YWbmtzmfqbA@mail.gmail.com>
 <20191011132921.GF4882@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011132921.GF4882@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Oct 11, 2019 at 04:29:21PM +0300, Laurent Pinchart wrote:
> I also would like to use that opportunity to discuss what we really mean
> by "e-mail workflow". Many developers on this list have expressed a need
> for an e-mail-compatible solution, and I really wonder if they meant
> e-mail as such, or if e-mail is more of an umbrella term that summarises
> the current advantages of e-mail that could also be provided by new
> tools that we would develop.

Unfortunately, it's unlikely I'll be able to arrange a trip to Lyon at
this point, so hopefully folks can take good notes and a summary
posted to workflows@ afterwards?

As far as "e-mail workflow" is concerned, I'd suggest that a
reasonable place to end up is that things that currently can be done
via e-mail should be continue to be viable over e-mail.  That way, we
can do a graduate cutover without people who are still using e-mail
don't lose functionality.   This means:

1) People should be able to submit a patch via e-mail
2) People should be able to comment on a patch via e-mail
       (with the comments reflected on the web review UI)
3) Comments made via the web review UI, and changes in the patch
   status (the patch gets a +1 or +2 rating; the patch gets submitted
   into a git tree, etc.) should be reflected via e-mail.

Gerrit does #3 already.  Patchwork does #1 and #2.  There has been a
proof of concept for #2 a Gerrit-like tool where the tool can look at
the quoted patch hunk, or the quoted texted which is being replied to,
which allows the comment to be assigned to the correct place in the
web review UI.

I do *not* think that administrative actions (e.g., those those
currently being done via the patchwork web or CLI UI) should be doable
via e-mail, because e-mail is painful to authenticate.  It's true that
the Debian Bug Tracking System (BTS) uses no authentication at all,
but for projects (like the Linux kernel) which are much higher
visibility, the ability to have patches be marked as abandoned or
automatically merged into a git repository without any authentication
at all is ripe for abuse.

A similar discussion should be had over what sort of operations need
to be off-line versus only doable when you are on-line and connected
to some service.  For example, if you are going to request that tests
get run on a test branch, to the extent that the tests are going to be
run on some set of test hardware, or test VM's, you have to be on-line
anyway.

Other operations, such as signing off on a patch and marking as
approved, probably *do* make sense to be doable when you are
disconnected from the internet (for example, while you are on an
airplane flying between North America and Lyon.  :-)

Cheers,

						- Ted
