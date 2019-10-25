Return-Path: <SRS0=qLuY=YS=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B0BCA9EA0
	for <workflows@archiver.kernel.org>; Fri, 25 Oct 2019 14:15:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 82FEC20663
	for <workflows@archiver.kernel.org>; Fri, 25 Oct 2019 14:15:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hdhwL/gv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729225AbfJYOPO (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 25 Oct 2019 10:15:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37570 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729240AbfJYOPO (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 25 Oct 2019 10:15:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1572012912;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nTOkWKh+OrI8qwieAalbwbhXZZ3nDjt7ZFlEERHOhxc=;
        b=hdhwL/gv5xX4tre8o/OucY3pMZDIFXGyM4502CDHJnuxqUtp+wsy4hBizbDrBNds6IIpZh
        v+GY8ZLAD/QCbqCSj7Ljabx6dN4QQpSkLwVr2tO9/26GkqMsUQciTUyy7s8HuAGtgH3kKm
        UyLC+84f9NzQBgsxVjrWMaBLSmwxDIs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-6cK6MK0VPeG5eYUqCN1WUA-1; Fri, 25 Oct 2019 10:15:08 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93F77476;
        Fri, 25 Oct 2019 14:15:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 82CDE450A;
        Fri, 25 Oct 2019 14:15:07 +0000 (UTC)
Received: from zmail19.collab.prod.int.phx2.redhat.com (zmail19.collab.prod.int.phx2.redhat.com [10.5.83.22])
        by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7582918089DC;
        Fri, 25 Oct 2019 14:15:07 +0000 (UTC)
Date:   Fri, 25 Oct 2019 10:15:07 -0400 (EDT)
From:   Veronika Kabatova <vkabatov@redhat.com>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     workflows@vger.kernel.org
Message-ID: <939398650.6672462.1572012907257.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191025133614.spkxym5k6fp4ofw5@chatter.i7.local>
References: <20191024205803.qdn6p32iyj5rqvc6@chatter.i7.local> <20191025111610.GB4740@pendragon.ideasonboard.com> <CACT4Y+ZzszuHGOAnG7a9vzOOmD+WJVGe7Vm+Oot=Cwjv=izjhA@mail.gmail.com> <239435160.6625525.1572006247406.JavaMail.zimbra@redhat.com> <20191025133614.spkxym5k6fp4ofw5@chatter.i7.local>
Subject: Re: Tooling and workflows meeting at OSS EU Lyon
MIME-Version: 1.0
X-Originating-IP: [10.40.204.186, 10.4.195.12]
Thread-Topic: Tooling and workflows meeting at OSS EU Lyon
Thread-Index: don+TSb2OCR/OEOdK/C/1UmrTAV8Ig==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 6cK6MK0VPeG5eYUqCN1WUA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org



----- Original Message -----
> From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
> To: "Veronika Kabatova" <vkabatov@redhat.com>
> Cc: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, workflows@vge=
r.kernel.org, "Dmitry Vyukov"
> <dvyukov@google.com>
> Sent: Friday, October 25, 2019 3:36:14 PM
> Subject: Re: Tooling and workflows meeting at OSS EU Lyon
>=20
> On Fri, Oct 25, 2019 at 08:24:07AM -0400, Veronika Kabatova wrote:
> >> > > 3. CI and bot integration
> >> > >     - identifying the data that maintainers/developers want to see
> >> > >     - communicating structured data over email
> >> > >     - providing consumable feeds of CI/bot jobs (as public-inbox
> >> > >       repositories?)
> >> > >     - avoiding bug duplication
> >> > >     - recognizing when a bug is fixed and following up on issues t=
hat
> >> > >       nobody has taken on
> >> > >
> >
> >Hi,
> >
> >if in the end any CI discussion fits into the agenda (or there will be
> >a separate discussion), please consider inviting CI people too. They can
> >offer information about what's feasible to do from CI point, and note
> >any feedback to know what we should adjust for CI to be more useful for
> >developers/maintainers.
> >
> >I can attend for CKI side and there should be multiple people from
> >Kernel CI and LKFT attending the conference too.
>=20
> I'm leaning towards having CI folks organize a separate session to go
> over integration points. I will be happy to attend that one as well, but
> if we have too many topics and too many attendees during the meeting we
> are trying to organize, it is unlikely to be very productive.
>=20

I'm not sure if there are any meetings of this nature planned but I'll
notify you if I learn anything new, thanks for the interest! There is also
ATS [0] on Thursday which will include presentations about CI systems and
how they are/plan to be integrated with upstream development, in case you
(or anyone else on this list) are attending that as well.

Please keep the list posted about the outcomes!

[0] https://events19.linuxfoundation.org/events/ats-2019/

Veronika

> -K
>=20

