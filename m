Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF04C072A2
	for <workflows@archiver.kernel.org>; Wed, 15 Nov 2023 18:58:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbjKOS6N (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 15 Nov 2023 13:58:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjKOS6N (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 15 Nov 2023 13:58:13 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9156C101
        for <workflows@vger.kernel.org>; Wed, 15 Nov 2023 10:58:09 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28932C433C8;
        Wed, 15 Nov 2023 18:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700074689;
        bh=mbFipe60nh3wXLVitXBcl5WWbT6GAolpsW6Rl8bu/7Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NpseXpzTT0wSMAcgWMBgg2pysbbYQcPIX7NHH/8c2wXEatuGVcSoAxK7hnneM8DjV
         iqDwv7Px+d2o3L6+b7ZG7VYKRFWEXiYh5bOLrYKR985uMxu7SuK78I0/upIWwcVpWj
         K9P/dAtEhJwm/gUauhw7RWPURRvUVgJt4wwIR4sl9diVcqTef0KBsVGU62oOr1lKfe
         onZxHEO6ln21IxWL9b6toFUlCb5lNEsvQhtZp1cV3hjQ9ZcQx7jHh77KQBVIRhIidM
         y3t4wHjjiED4OGjuHekJ8AqUGQTbDcInRINTbVVscnZNd/ukT9wBTf8V6hDjFbTYcl
         oadiSqjcx9eEw==
Date:   Wed, 15 Nov 2023 10:58:08 -0800
From:   "Darrick J. Wong" <djwong@kernel.org>
To:     Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Cc:     workflows@vger.kernel.org, Joe Perches <joe@perches.com>,
        Andy Whitcroft <apw@canonical.com>,
        Theodore Ts'o <tytso@mit.edu>, David Gow <davidgow@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mark Brown <broonie@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        Veronika Kabatova <vkabatov@redhat.com>,
        CKI <cki-project@redhat.com>, kernelci@lists.linux.dev,
        Chandan Babu R <chandanrlinux@gmail.com>,
        Dave Chinner <david@fromorbit.com>
Subject: Re: [PATCH 2/3] MAINTAINERS: Require kvm-xfstests smoke for ext4
Message-ID: <20231115185808.GD36211@frogsfrogsfrogs>
References: <20231115175146.9848-1-Nikolai.Kondrashov@redhat.com>
 <20231115175146.9848-3-Nikolai.Kondrashov@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115175146.9848-3-Nikolai.Kondrashov@redhat.com>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Nov 15, 2023 at 07:43:50PM +0200, Nikolai Kondrashov wrote:
> Signed-off-by: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
> ---
>  Documentation/process/tests.rst | 32 ++++++++++++++++++++++++++++++++
>  MAINTAINERS                     |  1 +
>  2 files changed, 33 insertions(+)
> 
> diff --git a/Documentation/process/tests.rst b/Documentation/process/tests.rst
> index 907311e91ec45..9a9ea3fe65c37 100644
> --- a/Documentation/process/tests.rst
> +++ b/Documentation/process/tests.rst
> @@ -33,3 +33,35 @@ particularly useful:
>  
>  :Source: A URL pointing to the source code of the test suite
>  :Docs: A URL pointing to further test suite documentation
> +
> +xfstests
> +--------
> +
> +:Summary: File system regression test suite
> +:Source: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git

You might as well use the https link to the fstests git repo.
https://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git

> +:Docs: https://github.com/tytso/xfstests-bld/blob/master/Documentation/what-is-xfstests.md

Awkardly, this github link is nice for rendering the markdown as html,
but I think the canonical source of xfstests-bld is also kernel.org:

https://git.kernel.org/pub/scm/fs/ext2/xfstests-bld.git

> +
> +As the name might imply, xfstests is a file system regression test suite which
> +was originally developed by Silicon Graphics (SGI) for the XFS file system.
> +Originally, xfstests, like XFS was only supported on the SGI's Irix operating
> +system. When XFS was ported to Linux, so was xfstests, and now xfstests is
> +only supported on Linux.
> +
> +Today, xfstests is used as a file system regression test suite for all of
> +Linux's major file systems: xfs, ext2, ext4, cifs, btrfs, f2fs, reiserfs, gfs,
> +jfs, udf, nfs, and tmpfs. Many file system maintainers will run a full set of
> +xfstests before sending patches to Linus, and will require that any major
> +changes be tested using xfstests before they are submitted for integration.
> +
> +The easiest way to start running xfstests is under KVM with xfstests-bld:
> +https://github.com/tytso/xfstests-bld/blob/master/Documentation/kvm-quickstart.md
> +
> +kvm-xfstests smoke
> +------------------
> +
> +:Summary: File system smoke tests
> +:Superset: xfstests

Source: https://git.kernel.org/pub/scm/fs/ext2/xfstests-bld.git

?

> +:Docs: https://github.com/tytso/xfstests-bld/blob/master/Documentation/kvm-quickstart.md
> +
> +The "kvm-xfstests smoke" is a minimal subset of xfstests for testing all major
> +file systems, running under KVM.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2565c04f0490e..f81a47d87ac26 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7974,6 +7974,7 @@ L:	linux-ext4@vger.kernel.org
>  S:	Maintained
>  W:	http://ext4.wiki.kernel.org
>  Q:	http://patchwork.ozlabs.org/project/linux-ext4/list/
> +V:	kvm-xfstests smoke

I wouldn't mind one of these being added to the XFS entry, though I've
cc'd the current and past maintainer(s) of XFS for their input.

--D

>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git
>  F:	Documentation/filesystems/ext4/
>  F:	fs/ext4/
> -- 
> 2.42.0
> 
