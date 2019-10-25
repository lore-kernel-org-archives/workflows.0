Return-Path: <SRS0=qLuY=YS=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC4FCA9EA0
	for <workflows@archiver.kernel.org>; Fri, 25 Oct 2019 12:24:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ECF182084C
	for <workflows@archiver.kernel.org>; Fri, 25 Oct 2019 12:24:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SuSb1cgj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407123AbfJYMYO (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 25 Oct 2019 08:24:14 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:42138 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2391200AbfJYMYO (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 25 Oct 2019 08:24:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1572006252;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CeknmD6gJcmcWvQbEVq2/Kp3xvs59ceHpZ0v7AM60/I=;
        b=SuSb1cgj2pMYa5P8x4TWMGCDCPnEI70hs0EQY3iVGY7mAqmETsKf1gHJ7X48AhRoRWbwmk
        iO/lluBpFrHe/ZayhsD0AlAp6vCPNTkxrizsCttMuhAJBFpqIFQR0U7NxpdmuIEncmYVjH
        5FmmvIbL/lBizFH50jibsEnq3ahKJEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-YusM6dwKOquZZqL_R0wmIw-1; Fri, 25 Oct 2019 08:24:09 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69102800D41;
        Fri, 25 Oct 2019 12:24:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 14C556092D;
        Fri, 25 Oct 2019 12:24:08 +0000 (UTC)
Received: from zmail19.collab.prod.int.phx2.redhat.com (zmail19.collab.prod.int.phx2.redhat.com [10.5.83.22])
        by colo-mx.corp.redhat.com (Postfix) with ESMTP id A0FD13FB40;
        Fri, 25 Oct 2019 12:24:07 +0000 (UTC)
Date:   Fri, 25 Oct 2019 08:24:07 -0400 (EDT)
From:   Veronika Kabatova <vkabatov@redhat.com>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        workflows@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>
Message-ID: <239435160.6625525.1572006247406.JavaMail.zimbra@redhat.com>
In-Reply-To: <CACT4Y+ZzszuHGOAnG7a9vzOOmD+WJVGe7Vm+Oot=Cwjv=izjhA@mail.gmail.com>
References: <20191024205803.qdn6p32iyj5rqvc6@chatter.i7.local> <20191025111610.GB4740@pendragon.ideasonboard.com> <CACT4Y+ZzszuHGOAnG7a9vzOOmD+WJVGe7Vm+Oot=Cwjv=izjhA@mail.gmail.com>
Subject: Re: Tooling and workflows meeting at OSS EU Lyon
MIME-Version: 1.0
X-Originating-IP: [10.40.204.186, 10.4.195.2]
Thread-Topic: Tooling and workflows meeting at OSS EU Lyon
Thread-Index: XW2lmXfqiovtLaw7Es2n/vg8jPg0cA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: YusM6dwKOquZZqL_R0wmIw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org



----- Original Message -----
> From: "Dmitry Vyukov" <dvyukov@google.com>
> To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
> Cc: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>, workflows@vg=
er.kernel.org
> Sent: Friday, October 25, 2019 1:20:32 PM
> Subject: Re: Tooling and workflows meeting at OSS EU Lyon
>=20
> On Fri, Oct 25, 2019 at 1:17 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Konstantin,
> >
> > On Thu, Oct 24, 2019 at 04:58:03PM -0400, Konstantin Ryabitsev wrote:
> > > Hi, everyone:
> > >
> > > So, if I read everything correctly, the meeting shall take place at O=
SS
> > > EU
> > > Lyon, on Tuesday, from 14:00 to 15:00. The following people have
> > > expressed interest in attending:
> > >
> > > - Steven Rostedt
> > > - Greg Kroah-Hartman
> > > - Dmitry Vyukov
> > > - Konstantin Ryabitsev
> > > - Christian Brauner
> > > - Laurent Pinchart
> > > - Jon Corbet
> > > - Daniel Vetter
> > > - Nicolas Belouin
> > > - Shuah Khan
> > >
> > > (If your name is not on this list but you're planning to attend, plea=
se
> > > follow up.)
> > >
> > > I have confirmed that we can use the Developer Lounge, which will
> > > contain either a whiteboard or a flip chart. Alternatively, if you th=
ink
> > > we should get a dedicated meeting room, we can book one on-site. It's=
 on
> > > a first-come, first-served basis and it doesn't look like I can book =
it
> > > before actually getting there. I will send exact details of the locat=
ion
> > > on Monday.
> >
> > Thank you for organising this.
> >
> > > Since we only have an hour, I propose that we focus on a couple of
> > > topics and perhaps keep them anchored to the immediate future,
> > > discussing evolutionary changes as opposed to grand schemes that will
> > > require changing half the known world.
> > >
> > > I can discuss any of the following topics at length:
> > >
> > > 1. Current tools and automation offered at kernel.org, plus new featu=
res
> > >    they are likely to see in the future that are interesting to both
> > >    developers and maintainers:
> > >     - public-inbox
> > >     - patchwork
> > >     - bugzilla
> > >     - pr-tracker-bot and git-patchwork-bot
> > >
> > > 2. Proposed enhancements to the email-based workflow
> > >     - cryptographic attestation of patches
> > >     - adding (and requiring) base tree information in submitted
> > >     patches/series
> > >     - git-to-ML bridges ("turn this pull request into a well-formatte=
d
> > >       patch series and send it to the right places")
> > >
> > > 3. CI and bot integration
> > >     - identifying the data that maintainers/developers want to see
> > >     - communicating structured data over email
> > >     - providing consumable feeds of CI/bot jobs (as public-inbox
> > >       repositories?)
> > >     - avoiding bug duplication
> > >     - recognizing when a bug is fixed and following up on issues that
> > >       nobody has taken on
> > >

Hi,

if in the end any CI discussion fits into the agenda (or there will be
a separate discussion), please consider inviting CI people too. They can
offer information about what's feasible to do from CI point, and note
any feedback to know what we should adjust for CI to be more useful for
developers/maintainers.

I can attend for CKI side and there should be multiple people from
Kernel CI and LKFT attending the conference too.



Veronika

> > > 4. Maintainer tooling
> > >     - adaptability of existing tools for kernel development, such as:
> > >       - GitHub/GitLab
> > >       - SourceHut
> > >       - Gerrit
> > >
> > >     - building on top of public-inbox feeds to create a tool that can=
:
> > >       - track patches obtained from multiple sources (multiple mailin=
g
> > >         lists, individual developer feeds, bot activity feeds, etc)
> > >       - collect the usual trailers (Reviewed-By's, etc)
> > >       - show interdiffs
> > >       - send automated templated replies
> > >       - apply series to a local git repository (streamlining "save th=
ese
> > >         patches as an mbox, make a new branch, run git-am")
> > >
> > > Unfortunately, that's enough topics to fill a 3-day mini-summit. :)
> > > Which ones are folks most interested in discussing during the meet-up=
,
> > > and which ones should be targeted for hallway discussions?
> >
> > I usually favour a top-down approach when discussing these topics,
> > starting with the big picture. I would thus have proposed discussing ho=
w
> > we can address the problems raised by the forge enthousiasts while not
> > compromising on the requirements of the decentralisation advocates.
>=20
> +1
>=20
> Spot improvements to a single system are much less disputable.
>=20
>=20
> > This being said, I think it would indeed take way more time than we hav=
e
> > allocated for this meeting. We could this pick one of the tools that we
> > think has the most potential today, and discuss how to move it towards
> > our long term goal that we haven't agreed on yet :-)
> >
> > I think the maintainer tooling topic is the one that would benefit the
> > most from face to face discussios as there's more brainstorming there,
> > while the other three could possibly be discussed by e-mail more easily=
.
>=20

