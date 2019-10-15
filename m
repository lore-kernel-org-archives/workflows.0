Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D1DC10F14
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 13:36:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4072120640
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 13:36:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730687AbfJONgG (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 09:36:06 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:38028 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728880AbfJONgF (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 15 Oct 2019 09:36:05 -0400
Received: from callcc.thunk.org (guestnat-104-133-0-98.corp.google.com [104.133.0.98] (may be forged))
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x9FDZRaO025897
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 15 Oct 2019 09:35:28 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id 0EB61420287; Tue, 15 Oct 2019 09:35:27 -0400 (EDT)
Date:   Tue, 15 Oct 2019 09:35:27 -0400
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191015133526.GC7456@mit.edu>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
 <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
 <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
 <20191014205658.GG5564@mit.edu>
 <20191015083741.1d0731e5@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191015083741.1d0731e5@gandalf.local.home>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Oct 15, 2019 at 08:37:41AM -0400, Steven Rostedt wrote:
> Now, if we had a way to send and receive upstream patches via a web
> site, that would actually make things easier.

Alas, for those corporations who choose to enable DMARC in hard-fail
mode (which includes google.com BTW, although thankfully, not
gmail.com) sending (from DMARC's perspective, "forging") e-mail from
someone at that particular domain won't work unless it comes from an
authorized e-mail server.

Of course, we do have a workaround for that, which is to use a
kernel.org address.

						- Ted

