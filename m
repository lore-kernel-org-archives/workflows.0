Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE7339526B;
	Mon, 13 Apr 2026 21:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776116380; cv=none; b=jf0/lc0YhiuwzBS/I4zitgHhVUqh98gu68H019RBVBsen6iFDWgBHxGG3pTkGfsLuB/iiIQUiXsLyyVcIuKHpHx28syKHtrMG952it7R1zgM3mQ7G+qW8BvTRv1sHzXuKtzQKpu4K7dwF/PVTibnrip5BMuaaPUKjtcH9LIXN+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776116380; c=relaxed/simple;
	bh=BYYLtxILWml7HLnHi7dzbwP+23u+hFpwZY9FDpuRDG8=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=UQTG7gJM5rc6geBEuMQbxayQvH4QmrkVWzKz1ZIwtMIsCzTZCmCnxO8zex6Q5VuFpRB6Gpa04KplnvE04/t3ezlxkAi0pNUhfdJ938ixRE1RjkyJ0BG+TBGpE97CIve9WAUPd4AIb+AyKxFLhBugkN/MkjuDcJnBhTUF39lFNdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R6h1V+YT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R6h1V+YT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C199DC2BCAF;
	Mon, 13 Apr 2026 21:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776116380;
	bh=BYYLtxILWml7HLnHi7dzbwP+23u+hFpwZY9FDpuRDG8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=R6h1V+YTAjs5nXFvzhuiiwtgyLkd+DBrX/LHZL9zqc2bxU4byrP3dkyhNk+I15glx
	 cnuF/9/iSCB9J+aj9oWN/07rAzndKdKBIUubW+/wWBC4Yls9kFtXB3SWoUZ8M6lIEb
	 x8P3kMntOy2NEWsnGVMUbGRN0+A7pen6fGjuq1BGDf3XgV3pFpm9bsgxCzm5Nzpa9o
	 3a4YSIgHpk6WvT3GsZSNNd+XOT8VZcKzcWG6mVgEiiYMAEOVI0rW/9JMkiHDEpdVfc
	 348xblFYwZZB0KKb4E7yDqAK+jt+0/l9QbbiBDBjyebi+spEACq3d+B9HCPg+hC06t
	 HB9RBNtVY5riA==
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id D458BF40068;
	Mon, 13 Apr 2026 17:39:38 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Mon, 13 Apr 2026 17:39:38 -0400
X-ME-Sender: <xms:mmLdaTPSyQKtAyBTjG8pAGulIMa50ELpBdn9VHJOR32cc6H3tQKV7A>
    <xme:mmLdaW6ryIeC6PTJQUOx6hZiGpP7vQ7jCGfbz8ia8q2pHJH9b316_n3IZ13MBfLDg
    62F0yeTjYO5dh3bXCWhPXVWnTY9xQ3C8F6hjeYeXXxq8lUO06oOeHkW>
X-ME-Received: <xmr:mmLdad0ZF96Szs7LNoaQcFP2kxHjNrFYai7CisPEIJnX_C44uMF0kJcUrboX9EVBTWtKkKhiFXtddNXXYSJ8HPj6TMCwQV-DCJw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefleefgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefkjghfufggtgfgsehtjeertddttdejnecuhfhrohhmpeffrghnucghihhl
    lhhirghmshcuoegujhgsfieskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    elhfeiudfgvdeijedtleeltdduueekffejjedvjefhgeevjeefueejledtleetjeenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegujhgsfidomh
    gvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudejjedvfedtgeehhedqfeeffeel
    gedtgeejqdgujhgsfieppehkvghrnhgvlhdrohhrghesfhgrshhtmhgrihhlrdgtohhmpd
    hnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtohhr
    sggvtheslhifnhdrnhgvthdprhgtphhtthhopehrughunhhlrghpsehinhhfrhgruggvrg
    gurdhorhhgpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopeifohhrkhhflhhofihssehvghgvrhdrkhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:mmLdaXzSP8ZdOGzAtp5sVM2av2DNEVRnYo4Rwl2kH3VRem6r-ATEBQ>
    <xmx:mmLdaXthW5v3svEyXxVA6aPakMTlVc6a8HoboLMdLz5-ucOx3pMhYA>
    <xmx:mmLdaRxzzqpxLZFrz8rdFmivl-j2KQ0jG2qXSiNDcsJFo97VxChpqA>
    <xmx:mmLdaSD6lwGCBwtLu5iIHRQXidr8BFF-_ZbrrW8ePyTZQxStlTPVVA>
    <xmx:mmLdaXdeHh3Cy-fb7KRCwBaeVaR9Jy_JAKKv11fQtAn4ddBvOS7-QIp6>
Feedback-ID: i67ae4b3e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Apr 2026 17:39:38 -0400 (EDT)
Date: Mon, 13 Apr 2026 14:39:37 -0700
From: Dan Williams <djbw@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Linux Documentation <linux-doc@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Kernel Workflows <workflows@vger.kernel.org>
Message-ID: <69dd6299440be_147c801005b@djbw-dev.notmuch>
In-Reply-To: <87wlyawum7.fsf@trenco.lwn.net>
References: <b7775383-da94-4098-8af9-2f672c4f1a71@infradead.org>
 <87wlyawum7.fsf@trenco.lwn.net>
Subject: Re: maintainer profiles
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jonathan Corbet wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:
> 
> > Hi,
> >
> > Is there supposed to be a difference (or distinction) in the contents of
> >
> > Documentation/process/maintainer-handbooks.rst
> > and
> > Documentation/maintainer/maintainer-entry-profile.rst
> > ?
> >
> > Can they be combined into one location?
> 
> Late to the party, sorry ... the original idea, I believe, was that
> maintainer-handbooks.rst would be for developers looking for a guidebook
> for a specific subsystem, while maintainer-entry-profile.rst was about
> how maintainers themselves should write their subsystem guide.
> Doubtless things have drifted since then...  But the intended audiences
> were different, so it might be good to think about bringing them back
> into focus.

Right, I think something (roughly / hand-wavy) like the below is the
intent. However, as I write that I notice that the combined list is a
bit of a mess. I also notice that there are more "P:" entries in
MAINTAINERS than there are entries in this maintainer-handbooks.rst
list.

So this probably wants to be a script that can build Documentation links
from MAINTAINERS, or otherwise provide a script for developers to query
a kernel tree for additional submission guides. It is probably not as
important for the built docs to link all guides as it is for developers
(or their agents) to live query a tree they are developing against.

Note the problem goes both ways, there are P: entries not in the
combined handbook list, like the Security subsystem, and there are
handbook entries without a P:, like the Tip tree.

diff --git a/Documentation/maintainer/maintainer-entry-profile.rst b/Documentation/maintainer/maintainer-entry-profile.rst
index 6020d188e13d..58e2af333692 100644
--- a/Documentation/maintainer/maintainer-entry-profile.rst
+++ b/Documentation/maintainer/maintainer-entry-profile.rst
@@ -92,24 +92,8 @@ full series, or privately send a reminder email. This section might also
 list how review works for this code area and methods to get feedback
 that are not directly from the maintainer.
 
-Existing profiles
------------------
-
-For now, existing maintainer profiles are listed here; we will likely want
-to do something different in the near future.
-
-.. toctree::
-   :maxdepth: 1
-
-   ../doc-guide/maintainer-profile
-   ../nvdimm/maintainer-entry-profile
-   ../arch/riscv/patch-acceptance
-   ../process/maintainer-soc
-   ../process/maintainer-soc-clean-dts
-   ../driver-api/media/maintainer-entry-profile
-   ../process/maintainer-netdev
-   ../driver-api/vfio-pci-device-specific-driver-acceptance
-   ../nvme/feature-and-quirk-policy
-   ../filesystems/nfs/nfsd-maintainer-entry-profile
-   ../filesystems/xfs/xfs-maintainer-entry-profile
-   ../mm/damon/maintainer-profile
+Maintainer Handbooks
+--------------------
+
+For examples of other subsystem handbooks see
+Documentation/process/maintainer-handbooks.rst.
diff --git a/Documentation/process/maintainer-handbooks.rst b/Documentation/process/maintainer-handbooks.rst
index 976391cec528..bc9299a04b1f 100644
--- a/Documentation/process/maintainer-handbooks.rst
+++ b/Documentation/process/maintainer-handbooks.rst
@@ -9,14 +9,33 @@ The purpose of this document is to provide subsystem specific information
 which is supplementary to the general development process handbook
 :ref:`Documentation/process <development_process_main>`.
 
+For developers, see below for all the known subsystem specific guides.
+If the subsystem you are contributing to does not have a guide listed
+here, it is fair to seek clarification of questions raised in
+Documentation/maintainer/maintainer-entry-profile.rst.
+
+For maintainers, consider documenting additional requirements and
+expectations if submissions routinely overlook specific submission
+criteria. See Documentation/maintainer/maintainer-entry-profile.rst.
+
 Contents:
 
 .. toctree::
    :numbered:
    :maxdepth: 2
 
+   maintainer-kvm-x86
    maintainer-netdev
    maintainer-soc
    maintainer-soc-clean-dts
+   maintainer-soc-clean-dts
    maintainer-tip
-   maintainer-kvm-x86
+   ../arch/riscv/patch-acceptance
+   ../doc-guide/maintainer-profile
+   ../driver-api/media/maintainer-entry-profile
+   ../driver-api/vfio-pci-device-specific-driver-acceptance
+   ../filesystems/nfs/nfsd-maintainer-entry-profile
+   ../filesystems/xfs/xfs-maintainer-entry-profile
+   ../mm/damon/maintainer-profile
+   ../nvdimm/maintainer-entry-profile
+   ../nvme/feature-and-quirk-policy


