Return-Path: <SRS0=Hr5F=ZA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA71BC5DF60
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 14:53:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7173E215EA
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 14:53:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ge4Pso+1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbfKHOxH (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 8 Nov 2019 09:53:07 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:50219 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725883AbfKHOxH (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 8 Nov 2019 09:53:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573224784;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SfCkRp41GhIVrpsFM7guBM/nVmY2M/pq1Av0VOHxnZc=;
        b=Ge4Pso+1ctB5mXYjhp9RzVec3aCewepWlj51EKzLmBbxNzLM3EwnPF4uNOn+IIAz6LGTwP
        JyOsY8dB1imMjLfrg2UTX3CXmCMIidVIzflSGeaX1pdQC7vr5oBNTlaF2v4y1cak/ZKl0b
        jXqecbYM9e7B6eoQQFP+H5i8eYWoVbA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-sH8OAz94NzCMBD0qMvgcQQ-1; Fri, 08 Nov 2019 09:53:01 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52D6E8017DD;
        Fri,  8 Nov 2019 14:53:00 +0000 (UTC)
Received: from redhat.com (dhcp-17-153.bos.redhat.com [10.18.17.153])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id A794C5DA7E;
        Fri,  8 Nov 2019 14:52:59 +0000 (UTC)
Date:   Fri, 8 Nov 2019 09:52:57 -0500
From:   Don Zickus <dzickus@redhat.com>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     workflows@vger.kernel.org, automated-testing@yoctoproject.org,
        Han-Wen Nienhuys <hanwen@google.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [Automated-testing] Structured feeds
Message-ID: <20191108145257.yb4fjfjc5yag6jqp@redhat.com>
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
 <20191107205304.3myfwfhaviizgr73@redhat.com>
 <CACT4Y+bpm+fqU_rLRnrTBt22Mu_6c4kRbHwvXbZXv+Q-37ZLaw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACT4Y+bpm+fqU_rLRnrTBt22Mu_6c4kRbHwvXbZXv+Q-37ZLaw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: sH8OAz94NzCMBD0qMvgcQQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Nov 08, 2019 at 09:05:02AM +0100, Dmitry Vyukov wrote:
> On Thu, Nov 7, 2019 at 9:53 PM Don Zickus <dzickus@redhat.com> wrote:
> >
> > On Tue, Nov 05, 2019 at 11:02:21AM +0100, Dmitry Vyukov wrote:
> > > Hi,
> > >
> > > This is another follow up after Lyon meetings. The main discussion wa=
s
> > > mainly around email process (attestation, archival, etc):
> > > https://lore.kernel.org/workflows/20191030032141.6f06c00e@lwn.net/T/#=
t
> > >
> > > I think providing info in a structured form is the key for allowing
> > > building more tooling and automation at a reasonable price. So I
> > > discussed with CI/Gerrit people and Konstantin how the structured
> > > information can fit into the current "feeds model" and what would be
> > > the next steps for bringing it to life.
> > >
> > > Here is the outline of the idea.
> > > The current public inbox format is a git repo with refs/heads/master
> > > that contains a single file "m" in RFC822 format. We add
> > > refs/heads/json with a single file "j" that contains structured data
> > > in JSON format. 2 separate branches b/c some clients may want to fetc=
h
> > > just one of them.
> > >
> > > Current clients will only create plain text "m" entry. However, newer
> > > clients can also create a parallel "j" entry with the same info in
> > > structured form. "m" and "j" are cross-referenced using the
> > > Message-ID. It's OK to have only "m", or both, but not only "j" (any
> > > client needs to generate at least some text representation for every
> > > message).
> >
> > Interesting idea.
> >
> > One of the nuisances of email is the client tools have quirks.  In Red =
Hat,
> > we have used patchworkV1 for quite a long time.  These email client 'qu=
irks'
> > broke a lot of expectations in the database leading us to fix the tool =
and
> > manually clean up the data.
> >
> > In the case of translating to a 'j' file.  What happens if the data is
> > incorrectly translated due to client 'quirks'?  Is it expected the 'j' =
data
> > is manually reviewed before committing (probably not).  Or is it left a=
lone
> > as-is? Or a follow-on 'j' change is committed?
>=20
> Good point.
> I would expect that eventually there will be updates to the format and
> new version. Which is easy to add to json with "version":2 attribute.
> Code that parses these messages will need to keep quirks for older
> formats.
> Realistically nobody will review the data (besides the initial
> testing). I guess in the end it depends on (1) how bad it's screwed,
> (2) if correct data is preserved in at least some form or not
> (consider a client pushes bad structured data, but it's also
> misrepresented in the plain text form, or simply missing there).
> Fixing up data later is not possible. Appending corrections is possible.

Ok.  Yeah, in my head I was thinking the data is largely right, just
occasionally 1 or 2 fields was misrepresented due to bad client tool or
human error in the text.

In Red Hat was use internal metadata for checking our patches through our
process (namely Bugzilla id).  It isn't unusual for someone to accidentally
fat-finger the bugzilla id when posting their patch.

I was thinking if there is a follow-on 'type' that appends corrections as y=
ou
stated, say 'type: correction' that 'corrects the original data.  This woul=
d
have to be linked through message-id or some unique identifier.

Then I assume any tool that parses the feed 'j' would correlate all the dat=
a
based around some unique ids such that picking up corrections would just be
a natural extension?

Cheers,
Don

>=20
> > A similar problem could probably be expanded to CI systems contributing=
 their
> > data in some result file 'r'.
>=20
> The idea is that all systems push "j'. It's the contents of the feed
> that matter. CI systems will push messages of different types (test
> results), but we don't need "r" for this.
>=20
> > Cheers,
> > Don
> >
> > >
> > > Currently we have public inbox feeds only for mailing lists. The idea
> > > is that more entities will have own "private" feeds. For example, eac=
h
> > > CI system, static analysis system, or third-party code review system
> > > has its own feed. Eventually people have own feeds too. The feeds can
> > > be relatively easily converted to local inbox, important into GMail,
> > > etc (potentially with some filtering).
> > >
> > > Besides private feeds there are also aggregated feeds to not require
> > > everybody to fetch thousands of repositories. kernel.org will provide
> > > one, but it can be mirrored (or build independently) anywhere else. I=
f
> > > I create https://github.com/dvyukov/kfeed.git for my feed and Linus
> > > creates git://git.kernel.org/pub/scm/linux/kernel/git/dvyukov/kfeed.g=
it,
> > > then the aggregated feed will map these to the following branches:
> > > refs/heads/github.com/dvyukov/kfeed/master
> > > refs/heads/github.com/dvyukov/kfeed/json
> > > refs/heads/git.kernel.org/pub/scm/linux/kernel/git/torvalds/kfeed/mas=
ter
> > > refs/heads/git.kernel.org/pub/scm/linux/kernel/git/torvalds/kfeed/jso=
n
> > > Standardized naming of sub-feeds allows a single repo to host multipl=
e
> > > feeds. For example, github/gitlab/gerrit bridge could host multiple
> > > individual feeds for their users.
> > > So far there is no proposal for feed auto-discovery. One needs to
> > > notify kernel.org for inclusion of their feed into the main aggregate=
d
> > > feed.
> > >
> > > Konstantin offered that kernel.org can send emails for some feeds.
> > > That is, normally one sends out an email and then commits it to the
> > > feed. Instead some systems can just commit the message to feed and
> > > then kernel.org will pull the feed and send emails on user's behalf.
> > > This allows clients to not deal with email at all (including mail
> > > client setup). Which is nice.
> > >
> > > Eventually git-lfs (https://git-lfs.github.com) may be used to embed
> > > blob's right into feeds. This would allow users to fetch only the
> > > blobs they are interested in. But this does not need to happen from
> > > day one.
> > >
> > > As soon as we have a bridge from plain-text emails into the structure=
d
> > > form, we can start building everything else in the structured world.
> > > Such bridge needs to parse new incoming emails, try to make sense out
> > > of them (new patch, new patch version, comment, etc) and then push th=
e
> > > information in structured form. Then e.g. CIs can fetch info about
> > > patches under review, test and post strctured results. Bridging in th=
e
> > > opposite direction happens semi-automatically as CI also pushes text
> > > representation of results and that just needs to be sent as email.
> > > Alternatively, we could have a separate explicit converted of
> > > structured message into plain text, which would allow to remove some
> > > duplication and present results in more consistent form.
> > >
> > > Similarly, it should be much simpler for Patchwork/Gerrit to present
> > > current patches under review. Local mode should work almost seamlessl=
y
> > > -- you fetch the aggregated feed and then run local instance on top o=
f
> > > it.
> > >
> > > No work has been done on the actual form/schema of the structured
> > > feeds. That's something we need to figure out working on a prototype.
> > > However, good references would be git-appraise schema:
> > > https://github.com/google/git-appraise/tree/master/schema
> > > and gerrit schema (not sure what's a good link). Does anybody know
> > > where the gitlab schema is? Or other similar schemes?
> > >
> > > Thoughts and comments are welcome.
> > > Thanks
> > > --
> > > _______________________________________________
> > > automated-testing mailing list
> > > automated-testing@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/automated-testing
> >

