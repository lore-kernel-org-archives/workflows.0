Return-Path: <SRS0=tG+E=YH=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C87ECE587
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 12:27:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 59C3221D7C
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 12:27:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730477AbfJNM1l (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 14 Oct 2019 08:27:41 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:53108 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730268AbfJNM1l (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 14 Oct 2019 08:27:41 -0400
Received: from callcc.thunk.org (guestnat-104-133-0-98.corp.google.com [104.133.0.98] (may be forged))
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x9ECQcIJ021424
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 14 Oct 2019 08:26:39 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id 0FF6D420287; Mon, 14 Oct 2019 08:26:38 -0400 (EDT)
Date:   Mon, 14 Oct 2019 08:26:37 -0400
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>
Cc:     Daniel Axtens <dja@axtens.net>,
        Stephen Hemminger <stephen@networkplumber.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Dave Airlie <airlied@gmail.com>,
        David Miller <davem@davemloft.net>, mchehab@kernel.org,
        skhan@linuxfoundation.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191014122637.GB5564@mit.edu>
References: <20191011.113254.1964556815296845399.davem@davemloft.net>
 <20191011155949.145f0f7d@coco.lan>
 <20191011.121153.1410013220730418292.davem@davemloft.net>
 <20191011141909.1ccb58b3@hermes.lan>
 <20191011174719.16e997f5@gandalf.local.home>
 <CAPM=9tyjGBC2e5mi7=OetWACYjQ6iwiLPNXpuAEReeyttKNrtw@mail.gmail.com>
 <20191011190009.6ee15756@gandalf.local.home>
 <20191011170839.75c52ad3@hermes.lan>
 <87lftotdv8.fsf@dja-thinkpad.axtens.net>
 <874l0bk3qb.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874l0bk3qb.fsf@toke.dk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Oct 14, 2019 at 12:42:36PM +0200, Toke Høiland-Jørgensen wrote:
> It should be detectable, though, right?
> 
> Say you have two independently administered patchwork instances (or even
> better, two different software packages entirely) that both subscribe to
> the mailing lists, and compare patch content with each other. They
> should at least be able to detect mismatches. Especially if you add a
> sanity check before discarding duplicate message-ids.

They don't even need to compare against each other; patchwork is about
to add a feature where you can look up patches via message-id, right?
That means it's easy enough to write a program which fetches patches
from patchwork, and compares it to the patches found in
lore.kernel.org.  If they don't match, then an alarm can be sounded.

Individuals who are reviewing patches can also compare the copy in
their inbox with the copy from lore or some other public inbox.  And
maintainers can compare copies from lore.kernel.org and patchwork
before they apply a patch.  (99% of the time, I actually use the patch
from my inbox, anyway.)

> This way you'd need to compromise multiple machines to achieve the kind
> of compromise you're worried about. And you can add more independent
> machines until you're satisfied that the risk is low enough :)

Yep, exactly.  This is basically the theory behind Certificate
Transparency[1], applied to patches.  For example, here's the
certificate transparency report for kernel.org:

   https://transparencyreport.google.com/https/certificates?cert_search=domain:kernel.org

					- Ted

[1] http://www.certificate-transparency.org/what-is-ct
