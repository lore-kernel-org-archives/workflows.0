Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A0EFC2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 17:06:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7994B61428
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 17:06:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231164AbhFQRIR (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 13:08:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:37772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231600AbhFQRIQ (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 17 Jun 2021 13:08:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5DE3F613AA;
        Thu, 17 Jun 2021 17:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623949568;
        bh=iZHivSFmwy9PD1UB+cJ9fMEhQp2AWC3zI/6g6nzQbV8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=rmsI8OxxP1BhAfMQrrtFcoAtTHp+dG/6BqOsk3gh/Z1jw3k+uZMeHN4zNZw5u7M0+
         B2uSRLJDKpQVJFsrdPHMe4QRX7r1RAmHCZBXtQB0O0snYzQq2gMPGC7imh49jbwl/b
         k7RA5Tc3an7UNmRgclpwlMTh0MiD6q3m4ocWXQl+Oo61VE3pft+B79SnnQhRVYqMG5
         UBz8RbV0yAUw+hy0zY2I7/Q5kMOtwF5sC2OOGreA+8KjRxdJ/Yaf9oUUlVqRXNfM2T
         wTBE8TTQyKzvkD6XMvzm4axRNsEwoJ8lGgvxNysMsPrkeZqHY+GBIJuPRlPtv8OElC
         VvS/xKfEnA1PQ==
Date:   Thu, 17 Jun 2021 10:06:07 -0700 (PDT)
From:   Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To:     Paolo Bonzini <pbonzini@redhat.com>
cc:     Mark Brown <broonie@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Jiri Kosina <jikos@kernel.org>, users@linux.kernel.org,
        workflows@vger.kernel.org
Subject: Re: RFC: Github PR bot questions
In-Reply-To: <b675c075-19e8-11ef-3174-49eb6975be6d@redhat.com>
Message-ID: <alpine.DEB.2.21.2106170954410.24906@sstabellini-ThinkPad-T480s>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local> <YMsGoI0UdbmUebhX@infradead.org> <nycvar.YFH.7.76.2106171031220.18969@cbobk.fhfr.pm> <CACT4Y+YoHYCKaLdZFSLqKsMz1j72i=k12FVpmSo-OyB7rCorsw@mail.gmail.com> <YMsfXuykH6z0ZbpM@infradead.org>
 <20210617145728.nahkvtxapozccm6c@nitro.local> <20210617151659.GF5067@sirena.org.uk> <b675c075-19e8-11ef-3174-49eb6975be6d@redhat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, 17 Jun 2021, Paolo Bonzini wrote:
> On 17/06/21 17:16, Mark Brown wrote:
> > > Won't this just end up reimplementing a lot of stuff that we already get
> > > "for
> > > free" from Github and other forges? Yes, I know Github is proprietary, but
> > > so
> > > are many SMTP gateways used to send the patch series. I don't see how what
> > > the GH bot would do is different from:
> > I think part of the concern here is that people have some standard
> > expectations for how projects they work with on Github are going to
> > function so if people end up using Github to submit patches we may end
> > up with some culture and process mismatches which could cause issues.
> 
> This is true, and it's why I liked the suggestion of a bot that auto-closes
> the pull request but still 1) removes the need for the submitter to set up
> "git send-email" and 2) only does the send after basic checks for
> Signed-off-by and the like (checkpatch is already a bit borderline).

+1 for this idea

This would be very useful. Obviously I have no issues with emails and
everyone in this thread has no issues with emails otherwise we wouldn't
be here. (Personally I despise the github workflow.)


But newcomers often complain that it is too difficult to configure their
company email to work with git send-email and the LKML. Things such as:

- the company only offers Outlook as a client
- the company automatically adds the annoying disclaimer at the end of
  every email ("IMPORTANT NOTICE: The contents of this email and any
  attachments are confidential and may also be privileged...")

My comeback was: you don't have to use the company email. Setup your own
email. Their answer was that they are not allowed to do company work on
their private emails.


The GH bot would allow them to skip the git send-email setup. However,
in all fairness, they would still be stuck to Outlook with the
disclaimer to reply to code reviews unless they do something.
