Return-Path: <SRS0=tG+E=YH=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B835C4CECE
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 20:57:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3A3A621721
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 20:57:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730635AbfJNU5P (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 14 Oct 2019 16:57:15 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:53750 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730335AbfJNU5O (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 14 Oct 2019 16:57:14 -0400
Received: from callcc.thunk.org (guestnat-104-133-0-98.corp.google.com [104.133.0.98] (may be forged))
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x9EKux5W003300
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 14 Oct 2019 16:57:00 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id 13856420287; Mon, 14 Oct 2019 16:56:59 -0400 (EDT)
Date:   Mon, 14 Oct 2019 16:56:58 -0400
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191014205658.GG5564@mit.edu>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
 <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
 <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Oct 14, 2019 at 04:58:17PM +0200, Dmitry Vyukov wrote:
> As one data point, I cannot send emails with git send-email anymore.
> It used to work, then broke and I don't know how to fix it. Now it says:
> 
> 5.7.8 Username and Password not accepted. Learn more at
> 5.7.8  https://support.google.com/mail/?p=BadCredentials
> s10sm8376885wrr.5 - gsmtp
> 
> I suspect it has something to do with two factor auth.
> So that's it: it cannot contribute to kernel right now.
> I will not consider time spent fixing it as useful time investment.

Note that this is a Googler-specific problem, as it's due to
corp-security requirements that other GMail users and most GSuites
customers won't have.  (For example, you could use another SMTP server
and bypass the corp. mail submission server, but for google.com e-mail
addresses, the DMARC settings foreclose that particular workaround.)

So it's an extreme case, and is an example of corp e-mail insanity.
The good news is that for companies that are really serious about
working with upstream, they will roll out solutions for their own
customers.  For example, with IBM, since Lotus notes was maximally
unfriendly to OSS development practices, they created a separate mail
system with ldap@linux.ibm.com addresses be cause it was simply
impossible to engage with upstream development using ibm.com
addresses.  So there are work arounds, and I encourage you to reach
out to other Google kernel developers --- and if you are unhappy,
please file internal bugs against the corp infrastructure.

Personally, my solution to this problem is to use a non-google address
(tytso@mit.edu) for upstream work, because life is too short to fight
with GMail.  (Although it is doable; as many people can attest.)

> I would say that we need to aim at  a process that does not require a
> friendly experienced person to answer any of your questions in the
> common case. Lots of people will simply not ask any questions.

If you work inside a corporation with "unique" e-mail settings, you
may need to ask a friendly experienced person inside your company, or
look for the "new employee" (Noogler) web documentation for working
with the kernel.

						- Ted
