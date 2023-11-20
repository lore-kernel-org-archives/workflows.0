Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0410DC197A0
	for <workflows@archiver.kernel.org>; Mon, 20 Nov 2023 12:40:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232695AbjKTMku convert rfc822-to-8bit (ORCPT
        <rfc822;workflows@archiver.kernel.org>);
        Mon, 20 Nov 2023 07:40:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233369AbjKTMks (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 20 Nov 2023 07:40:48 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D813F2;
        Mon, 20 Nov 2023 04:40:43 -0800 (PST)
Received: from hamburger.collabora.co.uk (hamburger.collabora.co.uk [IPv6:2a01:4f8:1c1c:f269::1])
        by madras.collabora.co.uk (Postfix) with ESMTP id 224BD66022D4;
        Mon, 20 Nov 2023 12:40:40 +0000 (GMT)
From:   "Gustavo Padovan" <gustavo.padovan@collabora.com>
In-Reply-To: <13fe4866-0522-4690-a060-160fdab9f54b@redhat.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
Date:   Mon, 20 Nov 2023 12:40:39 +0000
Cc:     "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org, "Joe Perches" <joe@perches.com>,
        "Andy Whitcroft" <apw@canonical.com>,
        "Theodore Tso" <tytso@mit.edu>, "David Gow" <davidgow@google.com>,
        "Steven Rostedt" <rostedt@goodmis.org>,
        "Mark Brown" <broonie@kernel.org>,
        "Shuah Khan" <skhan@linuxfoundation.org>,
        =?utf-8?q?Darrick_J_=2E_Wong?= <djwong@kernel.org>,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        "Veronika Kabatova" <vkabatov@redhat.com>,
        "CKI" <cki-project@redhat.com>, kernelci@lists.linux.dev,
        kernel@collabora.com,
        =?utf-8?q?Ricardo_Ca=C3=B1uelo_Navarro?= 
        <ricardo.canuelo@collabora.com>
To:     "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
MIME-Version: 1.0
Message-ID: <1341-655b5400-1-5f647c80@80242238>
Subject: =?utf-8?q?Re=3A?= [PATCH 1/3] =?utf-8?q?MAINTAINERS=3A?= Introduce 
 =?utf-8?q?V=3A?= field for required tests
User-Agent: SOGoMail 5.8.4
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thursday, November 16, 2023 09:14 -03, Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com> wrote:

> On 11/15/23 22:38, Konstantin Ryabitsev wrote:
> > On Wed, Nov 15, 2023 at 07:43:49PM +0200, Nikolai Kondrashov wrote:
> >> Introduce a new tag, 'Tested-with:', documented in the
> >> Documentation/process/submitting-patches.rst file. The tag is expected
> >> to reference the documented test suites, similarly to the 'V:' field,
> >> and to certify that the submitter executed the test suite on the change,
> >> and that it passed.
> > 
> > I'm not sure it should be a tag that stays all the way through git commit.
> > How about making it a cover letter/first patch footer?
> > 
> > tested-with: <suite>
> 
> Yes, that would be better indeed. However, checkpatch.pl doesn't process cover 
> letters, and so we would have no automated way to advertise and nudge people 
> towards testing.
 
At this year's LPC, there was quite some discussion around improving testing information, so this patch of yours lands has a great timing. :)

All your are proposing here is pretty interesting both for developers and CI systems, but it seems that a "Tested-with:" tag and checkpatch.pl validation will take quite some time to consolidate.

Would it make sense to split just the part that adds the V: field to MAINTAINERS and submit that as separate patchset together with its documentation? That way we can enable subsystem to start annotating their test suites already.

I also wonder how to make for subsystems that will have different test suites (eg something in kselftests and an external test suite). Would an alternative be pointing to a Documentation page with detailed info?

- Gus

-- 
Gustavo Padovan
Kernel Lead
Collabora Ltd.

