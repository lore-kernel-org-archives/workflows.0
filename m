Return-Path: <SRS0=i0oo=Y7=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AC0C5DF61
	for <workflows@archiver.kernel.org>; Thu,  7 Nov 2019 11:26:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0ED1E2187F
	for <workflows@archiver.kernel.org>; Thu,  7 Nov 2019 11:26:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="czBGGofU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727732AbfKGL0Z (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 7 Nov 2019 06:26:25 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:47853 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727278AbfKGL0Z (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 7 Nov 2019 06:26:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573125983;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4jcTgNfQXZKYYqxc/VTN5BUv8Vv+CLOaNZd+COJwz60=;
        b=czBGGofULzb2bUkjAPNQJtyGJ9njJem3/1GLRQlcgeCiah5M8+Np++4H3fXkIyFTQJAJUX
        GSOv4rKj4jOq2bNzvCee/fFda7sn0JoXP1lrUafqiwylEty6vL7dqNu/gAlA1g0+/xIUit
        U3qUtdK40IalcLwrtgx1yRtOGcgI8BA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-2s1OH60vM8u-euQ_SIk8Qg-1; Thu, 07 Nov 2019 06:26:20 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55B65107ACC3;
        Thu,  7 Nov 2019 11:26:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 08672600CE;
        Thu,  7 Nov 2019 11:26:17 +0000 (UTC)
Received: from zmail19.collab.prod.int.phx2.redhat.com (zmail19.collab.prod.int.phx2.redhat.com [10.5.83.22])
        by colo-mx.corp.redhat.com (Postfix) with ESMTP id A15C618095FF;
        Thu,  7 Nov 2019 11:26:17 +0000 (UTC)
Date:   Thu, 7 Nov 2019 06:26:17 -0500 (EST)
From:   Veronika Kabatova <vkabatov@redhat.com>
To:     Daniel Axtens <dja@axtens.net>, Dmitry Vyukov <dvyukov@google.com>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org, automated-testing@yoctoproject.org,
        Brendan Higgins <brendanhiggins@google.com>,
        Han-Wen Nienhuys <hanwen@google.com>,
        Kevin Hilman <khilman@baylibre.com>
Message-ID: <1033825454.8368196.1573125977348.JavaMail.zimbra@redhat.com>
In-Reply-To: <87tv7ggdio.fsf@dja-thinkpad.axtens.net>
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com> <8736f1hvbn.fsf@dja-thinkpad.axtens.net> <20191106205051.56v25onrxkymrfjz@chatter.i7.local> <CACT4Y+Ywzbwz7GNfOCJb+DGdKEdkAh+v+20hmNG7S1riEbhTNA@mail.gmail.com> <87tv7ggdio.fsf@dja-thinkpad.axtens.net>
Subject: Re: Structured feeds
MIME-Version: 1.0
X-Originating-IP: [213.175.37.11, 10.4.196.1, 10.5.100.50, 10.4.195.3]
Thread-Topic: Structured feeds
Thread-Index: ChM9RR+WWUJK5v9Jh8zIq+t/CyvFrg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 2s1OH60vM8u-euQ_SIk8Qg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org



----- Original Message -----
> From: "Daniel Axtens" <dja@axtens.net>
> To: "Dmitry Vyukov" <dvyukov@google.com>, "Konstantin Ryabitsev" <konstan=
tin@linuxfoundation.org>
> Cc: workflows@vger.kernel.org, automated-testing@yoctoproject.org, "Brend=
an Higgins" <brendanhiggins@google.com>,
> "Han-Wen Nienhuys" <hanwen@google.com>, "Kevin Hilman" <khilman@baylibre.=
com>, "Veronika Kabatova"
> <vkabatov@redhat.com>
> Sent: Thursday, November 7, 2019 11:57:19 AM
> Subject: Re: Structured feeds
>=20
> Dmitry Vyukov <dvyukov@google.com> writes:
>=20
> > On Wed, Nov 6, 2019 at 9:50 PM Konstantin Ryabitsev
> > <konstantin@linuxfoundation.org> wrote:
> >>
> >> On Thu, Nov 07, 2019 at 02:35:08AM +1100, Daniel Axtens wrote:
> >> >This is an non-trivial problem, fwiw. Patchwork's email parser clocks
> >> >in
> >> >at almost thirteen hundred lines, and that's with the benefit of the
> >> >Python standard library. It also regularly gets patched to handle
> >> >changes to email systems (e.g. DMARC), changes to git (git request-pu=
ll
> >> >format changed subtly in 2.14.3), the bizzare ways people send email,
> >> >and so on.
> >>
> >> I'm actually very interested in seeing patchwork switch from being fed
> >> mail directly from postfix to using public-inbox repositories as its
> >> source of patches. I know it's easy enough to accomplish as-is, by
> >> piping things from public-inbox to parsemail.sh, but it would be even
> >> more awesome if patchwork learned to work with these repos natively.
> >>
> >> The way I see it:
> >>
> >> - site administrator configures upstream public-inbox feeds
> >> - a backend process clones these repositories
> >>    - if it doesn't find a refs/heads/json, then it does its own parsin=
g
> >>      to generate a structured feed with patches/series/trailers/pull
> >>      requests, cross-referencing them by series as necessary. Somethin=
g
> >>      like a subset of this, excluding patchwork-specific data:
> >>      https://patchwork.kernel.org/api/1.1/patches/11177661/
> >>    - if it does find an existing structured feed, it simply uses it (e=
.g.
> >>      it was made available by another patchwork instance)
> >
> > It's an interesting feature if a patchwork instance would convert and
> > export text emails to structured info. Then it can be consumed by CIs
> > for precommit testing and other systems without the need to duplicate
> > conversion.
>=20
> This already happens.
>=20
> Snowpatch does this and uses it to run CI checks on patch series as soon
> as they arrive, and sends them back to patchwork as test results. It has
> been running on linuxppc-dev for over a year.
>=20
> Snowpatch is at https://github.com/ruscur/snowpatch
>=20
> An example patch showing the checks having been run is
> https://patchwork.ozlabs.org/patch/1190589/
>=20

CKI does something similar too [0].

The code contains some RHEL-specific checks as we are not running patch
testing for upstream yet. The PW checks can be submitted from the pipeline.
We should probably update the trigger to use the events API...


The only "structured information" CKI requires is to have the patch in the
correct PW project, which is mapped to a git tree/branch so we know where
to apply the patch. However there are cases when more information is needed=
,
such as if multiple different branches can be used with the same project, o=
r
the patch depends on another change.

This situation should be resolved with the freeform tagging feature I
proposed a while ago (blocked by DB refactoring; original series can be fou=
nd
at [1]). This feature would allow developers to add any tags to their patch=
es,
similar to the signed-off-by line. The extracted tags can then be queried i=
n
the API and used by CI.

I'll be totally honest and admit I ignored most of the implementation detai=
ls
of public inbox feeds (will take a look when I have some free time) but as
long as they contain the original email, the feature should be usable with
them too.


[0] https://gitlab.com/cki-project/pipeline-trigger/blob/master/triggers/pa=
tch_trigger.py
[1] https://patchwork.ozlabs.org/project/patchwork/list/?series=3D66057


Veronika

> I think there's a different CI system used for some device-tree patches:
> e.g. https://patchwork.ozlabs.org/patch/1190714/ - I have no idea how
> this works in the backend, but it also uses the patchwork API.
>=20
> Regards,
> Daniel
>=20

