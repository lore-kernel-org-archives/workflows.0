Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F2F0C10F14
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 17:07:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ED6162084B
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 17:07:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cmpwn.com header.i=@cmpwn.com header.b="qZe1ISas"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbfJORHc (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 13:07:32 -0400
Received: from mail.cmpwn.com ([45.56.77.53]:60442 "EHLO mail.cmpwn.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726470AbfJORHc (ORCPT <rfc822;workflows@vger.kernel.org>);
        Tue, 15 Oct 2019 13:07:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cmpwn.com; s=cmpwn;
        t=1571159252; bh=c9CxMf8lkS/JULrWJ2g7k+jAreTm75VNrabwxbXra3s=;
        h=In-Reply-To:Date:Subject:From:To:Cc;
        b=qZe1ISasxMfvczb2LLCxnNVL2sdvRiphY5M09j2UBQ5oKe0GZde0W2gwPyV5LYQol
         QDdNQA5hxqmaassSs7ZAWR30ttjikAxBBDhU4Cb5YppuOFhjmoNiT3Mp8Ynqvi6bed
         5Esikz/l7X0/KklPvzxPhdW8LEmiygd5PusbYFyw=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20191015164427.GK4875@pendragon.ideasonboard.com>
Date:   Tue, 15 Oct 2019 13:07:31 -0400
Subject: Re: RFE: use patchwork to submit a patch
From:   "Drew DeVault" <sir@cmpwn.com>
To:     "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Cc:     "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>,
        "Eric Wong" <e@80x24.org>, "Greg KH" <gregkh@linuxfoundation.org>,
        <patchwork@lists.ozlabs.org>, <workflows@vger.kernel.org>
Message-Id: <BXQ9GZQTCWAX.BYDMLBCWJ5UP@homura>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue Oct 15, 2019 at 7:44 PM Laurent Pinchart wrote:
> I'm not very confident that perfect transparent e-mail bridges could be
> developed, and the culprit here it e-mail. From forge to e-mail there's
> no real issue, we have structure data, and we write it out in text form.
> The other way around, though, involves recovering structure from text.
> If the MTAs, MDAs, MUAs and, quite importanttly, users, behave
> correctly, that's doable. We can handle some of the "features" of common
> M*A, but if someone decides to throw the formatting through the window
> completely, we'll be screwed.

Well, no, it can never be perfect. But I'm not trying to accomodate for,
as an example, someone who's deliberately trying to confusing the
system. It will probably always be based on heuristics in some degrees.

However, I think that social conformance is a force to be reckoned with.
Most people don't have to be taught how code review works on mailing
lists, they just watch others do it and naturally fall in line. Without
any formal structure at all, we've already more or less settled on a
shared set of patterns for email-driven code review. However, I think
that the following:

> An idea I was toying with in the past was to create a structured format
> for review, that would match what we use now in e-mail very closely, but
> with a clearly defined syntax and grammar. The format would appear as
> just plain e-mails to users, and a MUA that behaves reasonably would
> likely produce valid structured data as e-mail replies. Over time we
> could develop clients or teach some MUAs about the structured format,
> removing the risk that they, or the end users, would mess up a reply.
> The migration would be mostly transparent as it wouldn't really impact
> existing users of e-mail, and could thus be rolled out over a long
> period of time.

Is very reasonable. If we can come up with a standard which feels like
what we're already doing, but is written down, then tools have something
to conform to and users have some expectations for how to behave to make
their tools happy.

I would be up for putting up some kind of simple spec for bikeshedding
purposes, and teaching it to the thread parser that was built for
lists.sr.ht:

https://git.sr.ht/~emersion/python-emailthreads
