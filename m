Return-Path: <SRS0=p3fK=XS=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4977C4CECF
	for <workflows@archiver.kernel.org>; Mon, 23 Sep 2019 16:20:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 96B7F20820
	for <workflows@archiver.kernel.org>; Mon, 23 Sep 2019 16:20:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388969AbfIWQUM (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 23 Sep 2019 12:20:12 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:46377 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2388829AbfIWQUM (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 23 Sep 2019 12:20:12 -0400
Received: from callcc.thunk.org (guestnat-104-133-0-98.corp.google.com [104.133.0.98] (may be forged))
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x8NGK1LB021370
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 23 Sep 2019 12:20:02 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id 9F646420811; Mon, 23 Sep 2019 12:20:01 -0400 (EDT)
Date:   Mon, 23 Sep 2019 12:20:01 -0400
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     workflows@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: Kernel development collaboration platform wish list
Message-ID: <20190923162001.GD6005@mit.edu>
References: <1811089.yxvLMk49Ug@kreacher>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1811089.yxvLMk49Ug@kreacher>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

One of the things I'd like to add as a strong desire is the ability to
review patches via web if that's what users would like to do.  There
are some real benefits for web-based review.  It means that if you
need to see greater context, it's relatively easy to do this.  It also
is convenient to be able to see the conversation for a particular hunk
of code right alongside the code.

It's clear that whatever we do, it needs to be compatible with e-mail.
That's very clear.  But it would be useful if we can support both the
e-mail and web-based review.  There have some prototypes that have
been floated which shows that it is at least possible; perhaps
imperfectly, but something which provides a bidrectional gateway
between those who perfer to use e-mail and those that prefer to use a
web-based UI would be able to do it.

There will be many potential kernel contributors who will be used to
web-based UI's such as those that are available on github.  So while
remaining e-mail compatible, having some way of allow as many
operations to be done via web interfaces might help us get some newer
developers who are more comfortable to living on the web than some of
us more senior developers who remember when "gopher" was a text-based
search engine, and not a mascot for the Go programming langauge.  :-)

       	       	       	 	- Ted
