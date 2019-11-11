Return-Path: <SRS0=ZkQc=ZD=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56931C43331
	for <workflows@archiver.kernel.org>; Mon, 11 Nov 2019 09:20:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1CC0020674
	for <workflows@archiver.kernel.org>; Mon, 11 Nov 2019 09:20:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PoGCrv6x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbfKKJUg (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 11 Nov 2019 04:20:36 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:46124 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbfKKJUg (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 11 Nov 2019 04:20:36 -0500
Received: by mail-qt1-f196.google.com with SMTP id r20so867561qtp.13
        for <workflows@vger.kernel.org>; Mon, 11 Nov 2019 01:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hynVcniIp0/0J+eMAttnRguLbnJf9Inpj63K9Ab4FU8=;
        b=PoGCrv6xIJ/nckUMZJlPfpIt57xFJglrYtdXFrvxtHKpXzgVjDAx/bTAwnVKYPSufP
         Pa2jV9HDWhZo0aKzGyc+z/MmOKMO7YV5H7kxqtO7VFQGPBS/EMzUo3mo7xPdKVkzV44k
         5xohPvps0FOaPER8oX9lDIZCKbIu+ZcqUZr9S1MSdyR0y725u7xTHCmEHO/6SZmyjKhT
         6VplYqMKmnthSm+dfjN3k+v6a1DhYjz8R9qrsrb/Mo3xPMkccvflAxHdXJFuvNddflF4
         abvmX8EciV19CrIesh3HZcm7UIaxuYOHTwYsuPU30+cU8mfQnoL2k69EVPeYM74Fah58
         ApOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hynVcniIp0/0J+eMAttnRguLbnJf9Inpj63K9Ab4FU8=;
        b=rSpF9RhKwhSWsCOlMGW51znFu52YhU33Sj0CAYzjbq5usgoMNAE3j4vpvON1anVDfY
         OeMh1ldL8fUoRZdC7r7Yrz1Ad7MRVleGvTs3GBhrQYlWpOlT0oQIxzx822KyP/6e/JZg
         Xopy1axL9Z9G4bDCTkgeTmB+M1tvmu5wwJZUKBpeQECqNAhScx8x+2O8/ISYuj7TKa0/
         WdklAyLZ6gYecpi2xljXX9KoNRwdqCL8X3hXFidPRvB4z4/dat7w/h7fnV6gvmFzKa8B
         nB3MQslLnlV2NlORx2jcJES33tppaO1qwiGMXQk/os86FbsLpYNxw51G/uiBQBUVMQ1Y
         hgqA==
X-Gm-Message-State: APjAAAVyR+lTMw9kTUEDMasGx6LdI8CYZisZ1iFLTVdifMJ09Ism4/PJ
        qW3DueSWbzAxdPHS6SUGnM7KpaB70KnK81d8bPE/1w==
X-Google-Smtp-Source: APXvYqwYhdoq3Yd+oP8U1KVgWDLqyrYimmYOJCVgMOmnKKk7GsM5+VzayGnVCYsg48pLPtexWS3GM8UgU1uVSvOBeg8=
X-Received: by 2002:ac8:610a:: with SMTP id a10mr10197569qtm.50.1573464034652;
 Mon, 11 Nov 2019 01:20:34 -0800 (PST)
MIME-Version: 1.0
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
 <20191107205304.3myfwfhaviizgr73@redhat.com> <CACT4Y+bpm+fqU_rLRnrTBt22Mu_6c4kRbHwvXbZXv+Q-37ZLaw@mail.gmail.com>
 <20191108145257.yb4fjfjc5yag6jqp@redhat.com>
In-Reply-To: <20191108145257.yb4fjfjc5yag6jqp@redhat.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 11 Nov 2019 10:20:22 +0100
Message-ID: <CACT4Y+bxPxQ64HEO2uGRkbk9vJSeg64y10Lak4c2K54J7GyFFA@mail.gmail.com>
Subject: Re: [Automated-testing] Structured feeds
To:     Don Zickus <dzickus@redhat.com>
Cc:     workflows@vger.kernel.org, automated-testing@yoctoproject.org,
        Han-Wen Nienhuys <hanwen@google.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Nov 8, 2019 at 3:53 PM Don Zickus <dzickus@redhat.com> wrote:
>
> On Fri, Nov 08, 2019 at 09:05:02AM +0100, Dmitry Vyukov wrote:
> > On Thu, Nov 7, 2019 at 9:53 PM Don Zickus <dzickus@redhat.com> wrote:
> > >
> > > On Tue, Nov 05, 2019 at 11:02:21AM +0100, Dmitry Vyukov wrote:
> > > > Hi,
> > > >
> > > > This is another follow up after Lyon meetings. The main discussion was
> > > > mainly around email process (attestation, archival, etc):
> > > > https://lore.kernel.org/workflows/20191030032141.6f06c00e@lwn.net/T/#t
> > > >
> > > > I think providing info in a structured form is the key for allowing
> > > > building more tooling and automation at a reasonable price. So I
> > > > discussed with CI/Gerrit people and Konstantin how the structured
> > > > information can fit into the current "feeds model" and what would be
> > > > the next steps for bringing it to life.
> > > >
> > > > Here is the outline of the idea.
> > > > The current public inbox format is a git repo with refs/heads/master
> > > > that contains a single file "m" in RFC822 format. We add
> > > > refs/heads/json with a single file "j" that contains structured data
> > > > in JSON format. 2 separate branches b/c some clients may want to fetch
> > > > just one of them.
> > > >
> > > > Current clients will only create plain text "m" entry. However, newer
> > > > clients can also create a parallel "j" entry with the same info in
> > > > structured form. "m" and "j" are cross-referenced using the
> > > > Message-ID. It's OK to have only "m", or both, but not only "j" (any
> > > > client needs to generate at least some text representation for every
> > > > message).
> > >
> > > Interesting idea.
> > >
> > > One of the nuisances of email is the client tools have quirks.  In Red Hat,
> > > we have used patchworkV1 for quite a long time.  These email client 'quirks'
> > > broke a lot of expectations in the database leading us to fix the tool and
> > > manually clean up the data.
> > >
> > > In the case of translating to a 'j' file.  What happens if the data is
> > > incorrectly translated due to client 'quirks'?  Is it expected the 'j' data
> > > is manually reviewed before committing (probably not).  Or is it left alone
> > > as-is? Or a follow-on 'j' change is committed?
> >
> > Good point.
> > I would expect that eventually there will be updates to the format and
> > new version. Which is easy to add to json with "version":2 attribute.
> > Code that parses these messages will need to keep quirks for older
> > formats.
> > Realistically nobody will review the data (besides the initial
> > testing). I guess in the end it depends on (1) how bad it's screwed,
> > (2) if correct data is preserved in at least some form or not
> > (consider a client pushes bad structured data, but it's also
> > misrepresented in the plain text form, or simply missing there).
> > Fixing up data later is not possible. Appending corrections is possible.
>
> Ok.  Yeah, in my head I was thinking the data is largely right, just
> occasionally 1 or 2 fields was misrepresented due to bad client tool or
> human error in the text.
>
> In Red Hat was use internal metadata for checking our patches through our
> process (namely Bugzilla id).  It isn't unusual for someone to accidentally
> fat-finger the bugzilla id when posting their patch.
>
> I was thinking if there is a follow-on 'type' that appends corrections as you
> stated, say 'type: correction' that 'corrects the original data.  This would
> have to be linked through message-id or some unique identifier.
>
> Then I assume any tool that parses the feed 'j' would correlate all the data
> based around some unique ids such that picking up corrections would just be
> a natural extension?

Yes, this should be handled naturally in this model. Since it's not
possible to mutate any previously published info, everything is
represented as additions/corrections: adding a comment to a patch,
adding Reviewed-by, adding Nack, adding test results. The final state
of a patch is always reconstructed by "replaying" all messages
published regarding the patch. So naturally if we mis-parsed a message
as "Acked-by: X" and then corrected that to "Nacked-by: X" and
republished, whoever will replay the feed, should replace Acked-by
with Nacked-by.
