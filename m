Return-Path: <SRS0=Hr5F=ZA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B632DC5DF60
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 15:26:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 894532178F
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 15:26:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UiJYOHY3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbfKHP0U (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 8 Nov 2019 10:26:20 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:57185 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725941AbfKHP0U (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 8 Nov 2019 10:26:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573226778;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=v/UCtO5PkiJzAjgfCIpesJSsrkckZNF35closHNsRsA=;
        b=UiJYOHY31wARV4LJOPEjdckJBbrbXqEaRLnJQEI8b4vnE4FNfsL81dV1dLp34HSEaxPakB
        EPwdVxG/dR3YwfWxYuR6QunciWzbts7cjpEF0B4TSC6XoDjbUa0d3a9yLcJTmIhpbQZwm2
        Cz/P0m41dXy7puig93Qr60SnYZb6isA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-ZpAHCiqQNGiHdEm8ayT0Kw-1; Fri, 08 Nov 2019 10:26:13 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88B75477;
        Fri,  8 Nov 2019 15:26:12 +0000 (UTC)
Received: from redhat.com (ovpn-123-53.rdu2.redhat.com [10.10.123.53])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 947EF60BE2;
        Fri,  8 Nov 2019 15:26:11 +0000 (UTC)
Date:   Fri, 8 Nov 2019 10:26:09 -0500
From:   Don Zickus <dzickus@redhat.com>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Daniel Axtens <dja@axtens.net>, workflows@vger.kernel.org,
        automated-testing@yoctoproject.org,
        Han-Wen Nienhuys <hanwen@google.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [Automated-testing] Structured feeds
Message-ID: <20191108152609.runqdsajpe7llsvz@redhat.com>
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
 <8736f1hvbn.fsf@dja-thinkpad.axtens.net>
 <20191107204356.kg3ddamtx74b6q4p@redhat.com>
 <CACT4Y+YTe7kpEvchsHU99fH1y-STYR_tteuHTYKGUOjf6oH9kQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACT4Y+YTe7kpEvchsHU99fH1y-STYR_tteuHTYKGUOjf6oH9kQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: ZpAHCiqQNGiHdEm8ayT0Kw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Nov 08, 2019 at 08:58:44AM +0100, Dmitry Vyukov wrote:
> On Thu, Nov 7, 2019 at 9:44 PM Don Zickus <dzickus@redhat.com> wrote:
> >
> > On Thu, Nov 07, 2019 at 02:35:08AM +1100, Daniel Axtens wrote:
> > > > As soon as we have a bridge from plain-text emails into the structu=
red
> > > > form, we can start building everything else in the structured world=
.
> > > > Such bridge needs to parse new incoming emails, try to make sense o=
ut
> > > > of them (new patch, new patch version, comment, etc) and then push =
the
> > > > information in structured form. Then e.g. CIs can fetch info about
> > >
> > > This is an non-trivial problem, fwiw. Patchwork's email parser clocks=
 in
> > > at almost thirteen hundred lines, and that's with the benefit of the
> > > Python standard library. It also regularly gets patched to handle
> > > changes to email systems (e.g. DMARC), changes to git (git request-pu=
ll
> > > format changed subtly in 2.14.3), the bizzare ways people send email,
> > > and so on.
> >
> > Does it ever make sense to just use git to do the translation to struct=
ured
> > json?  Git has similar logic and can easily handle its own changes.  To=
ols
> > like git-mailinfo and git-mailsplit probably do a good chunk of the
> > work today.
> >
> > It wouldn't pull together series info.
>=20
> Hi Don,
>=20
> Could you elaborate? What exactly do you mean? I don't understand the
> overall proposal.

The problem I was looking at was, patchwork has this large elaborate python
code to translate human git formatted patches into some structured form.
And rightfully so.

But git has similar code in order to make git-am work.

When applying an email to public-inbox, I had assumed it was using a tool
like git-am that would call into git-mailsplit and git-mailinfo to split
apart the email into various pieces and put them in .git/rebase-apply.

At that point most of the text parsing is done.

So the thought was to have another public-inbox tool that took advantage of
the already split data and just take the small step to finish converting
into a structured file 'j'.  As opposed to sending the text email through a=
n
external tool like patchwork to re-split the data into structured pieces
again.

Then adding to that thought was, every time git changed its format or text
output, instead of updating external tools, just leverage git's existing
knowledge of the change (assuming public-inbox used the latest git tool
consistently) would reduce the ripple effect of having to update all
external tools before developers can utilize new git features or changes.

But looking through the public-inbox code, it appears to do things
differently, so the idea may not work at all.

So just treat my idea as looking at the problem from a different angle to
see if there is an easier solution.

Cheers,
Don

