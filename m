Return-Path: <SRS0=Hr5F=ZA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C98FA372C
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 08:05:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3DF7821D7B
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 08:05:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E4f1rCxs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727421AbfKHIFQ (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 8 Nov 2019 03:05:16 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:46531 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730374AbfKHIFP (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 8 Nov 2019 03:05:15 -0500
Received: by mail-qt1-f193.google.com with SMTP id u22so5453307qtq.13
        for <workflows@vger.kernel.org>; Fri, 08 Nov 2019 00:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y4wj1fGeXkDgtnRZoY2WcPxyWzZKtXgtTzChApPdFlg=;
        b=E4f1rCxshkS4luTXkvCwEG4C7i9jV17GOU+0eSgt3Tx0ZNL/eB//OSK9j7wspHdUa2
         OoXBgp1VM8PDGLXxrDLUPIjoSXoP2jNIkfIz5rQcPKIKnOcvcaU+C0TTF5iTJnps0Y5G
         0mcDO68nQgjBQZIJUrdNKHIoWBGGwoJsKvx3+vMVGq4BbQUZW/djEYxVgi+EA7WjyL7q
         HhvU3aZCJg7s30mEqNSCDIF2s0uTwSPKwRJeKTgjd9g28TgZQ4nk8uciTlsSIde9L5lv
         ZQcvJPQ5/a7tFy6oDBYGhByIADHSeqOOY2O/S72Wgrm3iE7vj/Bn3sgqOV7DKqQGEgLf
         xspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y4wj1fGeXkDgtnRZoY2WcPxyWzZKtXgtTzChApPdFlg=;
        b=U8YJxOLvBg5Xok/8RHUNM8C0E0izWiWPkraYOfiwfFnkgLS6k0qT5Oh22IfvTmmZSs
         p3vyIRn+3yNT4CS/n6rFkRa/Qo6B9KUle5cYZ83r2F1RnBLIIEtTdHif8OzTSq4bOKIz
         Mai8p7ItPQ1mNFSy3LFnhYWeV2qmGVgsHeWYWLKcdQQ+m0HCr7KgP6LS7yDzYt7upwlt
         epsbFiL4dLBECsTnkDSmgVnvoPYrK/x/YWPtYls9YXW57pDOo2MWSl9feNy/fPXwJVZ8
         E7f0GE2sMAYMD0klYLXm5NWvzV9tZrsJi+8PtnQY1AFs6RgXMVlNNzuEwc8MffZZkqqp
         1EfA==
X-Gm-Message-State: APjAAAW4IKLTibnLiyNGbC4ZQVa7Ss134tqHh+NFv7W6Qpys03E0I+SO
        OauoYuCkA0WY4rkeiBC3wkP9QaD96UbdBWOLZAYO8g==
X-Google-Smtp-Source: APXvYqz+hZpbOWKYMDgGBw7dUYzWrJCpa4xASBk9pU7Gy0ImxuLXVSBsirbF0fYzBMVA9qdHT5NZZAZaj8MHRQshznA=
X-Received: by 2002:ac8:ccf:: with SMTP id o15mr9114673qti.380.1573200314071;
 Fri, 08 Nov 2019 00:05:14 -0800 (PST)
MIME-Version: 1.0
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
 <20191107205304.3myfwfhaviizgr73@redhat.com>
In-Reply-To: <20191107205304.3myfwfhaviizgr73@redhat.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 8 Nov 2019 09:05:02 +0100
Message-ID: <CACT4Y+bpm+fqU_rLRnrTBt22Mu_6c4kRbHwvXbZXv+Q-37ZLaw@mail.gmail.com>
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

On Thu, Nov 7, 2019 at 9:53 PM Don Zickus <dzickus@redhat.com> wrote:
>
> On Tue, Nov 05, 2019 at 11:02:21AM +0100, Dmitry Vyukov wrote:
> > Hi,
> >
> > This is another follow up after Lyon meetings. The main discussion was
> > mainly around email process (attestation, archival, etc):
> > https://lore.kernel.org/workflows/20191030032141.6f06c00e@lwn.net/T/#t
> >
> > I think providing info in a structured form is the key for allowing
> > building more tooling and automation at a reasonable price. So I
> > discussed with CI/Gerrit people and Konstantin how the structured
> > information can fit into the current "feeds model" and what would be
> > the next steps for bringing it to life.
> >
> > Here is the outline of the idea.
> > The current public inbox format is a git repo with refs/heads/master
> > that contains a single file "m" in RFC822 format. We add
> > refs/heads/json with a single file "j" that contains structured data
> > in JSON format. 2 separate branches b/c some clients may want to fetch
> > just one of them.
> >
> > Current clients will only create plain text "m" entry. However, newer
> > clients can also create a parallel "j" entry with the same info in
> > structured form. "m" and "j" are cross-referenced using the
> > Message-ID. It's OK to have only "m", or both, but not only "j" (any
> > client needs to generate at least some text representation for every
> > message).
>
> Interesting idea.
>
> One of the nuisances of email is the client tools have quirks.  In Red Hat,
> we have used patchworkV1 for quite a long time.  These email client 'quirks'
> broke a lot of expectations in the database leading us to fix the tool and
> manually clean up the data.
>
> In the case of translating to a 'j' file.  What happens if the data is
> incorrectly translated due to client 'quirks'?  Is it expected the 'j' data
> is manually reviewed before committing (probably not).  Or is it left alone
> as-is? Or a follow-on 'j' change is committed?

Good point.
I would expect that eventually there will be updates to the format and
new version. Which is easy to add to json with "version":2 attribute.
Code that parses these messages will need to keep quirks for older
formats.
Realistically nobody will review the data (besides the initial
testing). I guess in the end it depends on (1) how bad it's screwed,
(2) if correct data is preserved in at least some form or not
(consider a client pushes bad structured data, but it's also
misrepresented in the plain text form, or simply missing there).
Fixing up data later is not possible. Appending corrections is possible.

> A similar problem could probably be expanded to CI systems contributing their
> data in some result file 'r'.

The idea is that all systems push "j'. It's the contents of the feed
that matter. CI systems will push messages of different types (test
results), but we don't need "r" for this.

> Cheers,
> Don
>
> >
> > Currently we have public inbox feeds only for mailing lists. The idea
> > is that more entities will have own "private" feeds. For example, each
> > CI system, static analysis system, or third-party code review system
> > has its own feed. Eventually people have own feeds too. The feeds can
> > be relatively easily converted to local inbox, important into GMail,
> > etc (potentially with some filtering).
> >
> > Besides private feeds there are also aggregated feeds to not require
> > everybody to fetch thousands of repositories. kernel.org will provide
> > one, but it can be mirrored (or build independently) anywhere else. If
> > I create https://github.com/dvyukov/kfeed.git for my feed and Linus
> > creates git://git.kernel.org/pub/scm/linux/kernel/git/dvyukov/kfeed.git,
> > then the aggregated feed will map these to the following branches:
> > refs/heads/github.com/dvyukov/kfeed/master
> > refs/heads/github.com/dvyukov/kfeed/json
> > refs/heads/git.kernel.org/pub/scm/linux/kernel/git/torvalds/kfeed/master
> > refs/heads/git.kernel.org/pub/scm/linux/kernel/git/torvalds/kfeed/json
> > Standardized naming of sub-feeds allows a single repo to host multiple
> > feeds. For example, github/gitlab/gerrit bridge could host multiple
> > individual feeds for their users.
> > So far there is no proposal for feed auto-discovery. One needs to
> > notify kernel.org for inclusion of their feed into the main aggregated
> > feed.
> >
> > Konstantin offered that kernel.org can send emails for some feeds.
> > That is, normally one sends out an email and then commits it to the
> > feed. Instead some systems can just commit the message to feed and
> > then kernel.org will pull the feed and send emails on user's behalf.
> > This allows clients to not deal with email at all (including mail
> > client setup). Which is nice.
> >
> > Eventually git-lfs (https://git-lfs.github.com) may be used to embed
> > blob's right into feeds. This would allow users to fetch only the
> > blobs they are interested in. But this does not need to happen from
> > day one.
> >
> > As soon as we have a bridge from plain-text emails into the structured
> > form, we can start building everything else in the structured world.
> > Such bridge needs to parse new incoming emails, try to make sense out
> > of them (new patch, new patch version, comment, etc) and then push the
> > information in structured form. Then e.g. CIs can fetch info about
> > patches under review, test and post strctured results. Bridging in the
> > opposite direction happens semi-automatically as CI also pushes text
> > representation of results and that just needs to be sent as email.
> > Alternatively, we could have a separate explicit converted of
> > structured message into plain text, which would allow to remove some
> > duplication and present results in more consistent form.
> >
> > Similarly, it should be much simpler for Patchwork/Gerrit to present
> > current patches under review. Local mode should work almost seamlessly
> > -- you fetch the aggregated feed and then run local instance on top of
> > it.
> >
> > No work has been done on the actual form/schema of the structured
> > feeds. That's something we need to figure out working on a prototype.
> > However, good references would be git-appraise schema:
> > https://github.com/google/git-appraise/tree/master/schema
> > and gerrit schema (not sure what's a good link). Does anybody know
> > where the gitlab schema is? Or other similar schemes?
> >
> > Thoughts and comments are welcome.
> > Thanks
> > --
> > _______________________________________________
> > automated-testing mailing list
> > automated-testing@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/automated-testing
>
