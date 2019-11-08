Return-Path: <SRS0=Hr5F=ZA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97EFAFA372C
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 14:54:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A90521882
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 14:54:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gzU43IHZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbfKHOyW (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 8 Nov 2019 09:54:22 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:52350 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725883AbfKHOyW (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 8 Nov 2019 09:54:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573224861;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4PjQe1ixPLhI81GRV83mYtT4pFktm5pHW3AChoNuZVI=;
        b=gzU43IHZ5qSeu1XwFP+c0CkbG7SN18R3cPZ5N2W+Dmaza2Z1cmED+QuL3Lpzwhz4LkHpUV
        Pc/CZS0tsNybKMsDebCs3ypJfWsjdwe09lF7maRsxQD8Xi1EOd8YQpG6pek4/AD+wAPt2F
        sY5XMvMTbOonufDh9VFkKRuO9rsgJGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-qbwJ_1abM0KS3O4Yseh5Yw-1; Fri, 08 Nov 2019 09:54:17 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0FB0180496F;
        Fri,  8 Nov 2019 14:54:15 +0000 (UTC)
Received: from redhat.com (dhcp-17-153.bos.redhat.com [10.18.17.153])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 436445DA7E;
        Fri,  8 Nov 2019 14:54:15 +0000 (UTC)
Date:   Fri, 8 Nov 2019 09:54:13 -0500
From:   Don Zickus <dzickus@redhat.com>
To:     Daniel Axtens <dja@axtens.net>
Cc:     patchwork@lists.ozlabs.org, Dmitry Vyukov <dvyukov@google.com>,
        workflows@vger.kernel.org, automated-testing@yoctoproject.org,
        Han-Wen Nienhuys <hanwen@google.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [Automated-testing] Structured feeds
Message-ID: <20191108145413.nw7cmr5r4e5jmu6p@redhat.com>
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
 <8736f1hvbn.fsf@dja-thinkpad.axtens.net>
 <20191107204356.kg3ddamtx74b6q4p@redhat.com>
 <87k18ah9sq.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
In-Reply-To: <87k18ah9sq.fsf@dja-thinkpad.axtens.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: qbwJ_1abM0KS3O4Yseh5Yw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Nov 08, 2019 at 10:44:37PM +1100, Daniel Axtens wrote:
> Don Zickus <dzickus@redhat.com> writes:
>=20
> > On Thu, Nov 07, 2019 at 02:35:08AM +1100, Daniel Axtens wrote:
> >> > As soon as we have a bridge from plain-text emails into the structur=
ed
> >> > form, we can start building everything else in the structured world.
> >> > Such bridge needs to parse new incoming emails, try to make sense ou=
t
> >> > of them (new patch, new patch version, comment, etc) and then push t=
he
> >> > information in structured form. Then e.g. CIs can fetch info about
> >>=20
> >> This is an non-trivial problem, fwiw. Patchwork's email parser clocks =
in
> >> at almost thirteen hundred lines, and that's with the benefit of the
> >> Python standard library. It also regularly gets patched to handle
> >> changes to email systems (e.g. DMARC), changes to git (git request-pul=
l
> >> format changed subtly in 2.14.3), the bizzare ways people send email,
> >> and so on.
> >
> > Does it ever make sense to just use git to do the translation to struct=
ured
> > json?  Git has similar logic and can easily handle its own changes.  To=
ols
> > like git-mailinfo and git-mailsplit probably do a good chunk of the
> > work today.
> >
> +patchwork@
>=20
> So patchwork, in theory at least, is VCS-agnostic: if a mail contains a
> unified-diff, we can treat it as a patch. We do have some special
> handling for git pull requests, but we also have tests for parsing of
> CVS and if memory serves Mercurial too. So we haven't wanted to depend
> on git-specific tools. Maybe in future we will give up on that, but we
> haven't yet.

Fair point.  Thanks!

Cheers,
Don

>=20
> Regards,
> Daniel
>=20
> > It wouldn't pull together series info.
> >
> > Just a thought.
> >
> > Cheers,
> > Don
> >
> >
> >
> >>=20
> >> Patchwork does expose much of this as an API, for example for patches:
> >> https://patchwork.ozlabs.org/api/patches/?order=3D-id so if you want t=
o
> >> build on that feel free. We can possibly add data to the API if that
> >> would be helpful. (Patches are always welcome too, if you don't want t=
o
> >> wait an indeterminate amount of time.)
> >>=20
> >> Regards,
> >> Daniel
> >>=20
> >>=20
> >> --=20
> >> _______________________________________________
> >> automated-testing mailing list
> >> automated-testing@yoctoproject.org
> >> https://lists.yoctoproject.org/listinfo/automated-testing

