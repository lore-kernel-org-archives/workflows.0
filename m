Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F972FFDE6;
	Tue,  6 Jan 2026 20:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767732680; cv=none; b=uwqE9QlmXm6MiqiyU8aXMTGsj6TTbqInUDWXYE79l+XuLY5gWxNb9NChS/4hYFI9ANsnIr3LS9wNWCZi6B5Fj5ocpwUSWTryG3wYjizcDQKCivr3glks34evWe4Vr4J0xhJBqDrLpccWpJxYC0aCw/EMbbCfxPF3zWm2o8OnaM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767732680; c=relaxed/simple;
	bh=q2NJ/UMQfpyr/61kC9tLqEze95XT1781izlqN5jwoyk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f+1IUofm42tkAjHwhNwv4OaAJJb60dMFvyCbWeeT6PuM2dtFdyNtJnTRVXiBVGTWDVlSq+jj6Wt9R5BkTPmy1yaDZ+eCXspyiWeExhnAW5UaS5ktcw3oLtnorQ9ox6B7tu997X/O0gn4FOeYNqn0HSqvprz9d1FQK20D22K9cNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TzXy7efP; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TzXy7efP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767732677; x=1799268677;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=q2NJ/UMQfpyr/61kC9tLqEze95XT1781izlqN5jwoyk=;
  b=TzXy7efPyfNq3pOkYEXMZUs1xKNNuWgVSfQOKu6cfZHLKdn7gQH0cZjO
   zm/R7kC4uOC9NIgYErDxclZNHhqHJV+KhrJvd2WAwOngvjmbnWASiKlhi
   9ozqPXMZAgYjHH/9BXw5WLpekHBQwM/iMaC+l8OLm8gF9EUjiZE+r1XFH
   84qUqwcqZ/qVik06+vLtyPm7GcypEfY1ekMceWhybHDwH2oTulwjyubzP
   TYYkhkZuX1FUNg4dp1Tb7uIlcJFADdCM5ON5BSmnUqcRkx0zKwigP4Eo3
   KA58iO5/KZAe3fLF/QGjPacTZ6omnjLSIhtXzn2lfUgnrtsLemvfjkP9N
   w==;
X-CSE-ConnectionGUID: Zte1R6cNRzul5Xc4iPF6CQ==
X-CSE-MsgGUID: 6hYglZQTTjyCtmqSIWhZOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69013096"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="69013096"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 12:51:15 -0800
X-CSE-ConnectionGUID: HsQZTIELTiWAYBSChrRoMg==
X-CSE-MsgGUID: lgi75smxT2iCjL5slzK1Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="233885036"
Received: from smtp.ostc.intel.com ([10.54.29.231])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 12:51:15 -0800
Received: from ray2.jf.intel.com (unknown [10.24.81.162])
	by smtp.ostc.intel.com (Postfix) with ESMTP id 9AA716369;
	Tue,  6 Jan 2026 12:51:14 -0800 (PST)
From: Dave Hansen <dave.hansen@linux.intel.com>
To: linux-kernel@vger.kernel.org
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	SeongJae Park <sj@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	NeilBrown <neilb@ownmail.net>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Theodore Ts'o <tytso@mit.edu>,
	Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Vlastimil Babka <vbabka@suse.cz>,
	workflows@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: [PATCH] [v3] Documentation: Provide guidelines for tool-generated content
Date: Tue,  6 Jan 2026 12:51:05 -0800
Message-Id: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the last few years, the capabilities of coding tools have exploded.
As those capabilities have expanded, contributors and maintainers have
more and more questions about how and when to apply those
capabilities.

Add new Documentation to guide contributors on how to best use kernel
development tools, new and old.

Note, though, there are fundamentally no new or unique rules in this
new document. It clarifies expectations that the kernel community has
had for many years. For example, researchers are already asked to
disclose the tools they use to find issues by
Documentation/process/researcher-guidelines.rst. This new document
just reiterates existing best practices for development tooling.

In short: Please show your work and make sure your contribution is
easy to review.

Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Shuah Khan <shuah@kernel.org>
Reviewed-by: Kees Cook <kees@kernel.org>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Reviewed-by: SeongJae Park <sj@kernel.org>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Steven Rostedt <rostedt@goodmis.org>
Cc: NeilBrown <neilb@ownmail.net>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Theodore Ts'o <tytso@mit.edu>
Cc: Sasha Levin <sashal@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: workflows@vger.kernel.org
Cc: ksummit@lists.linux.dev

--

There has been a ton of feedback since v2. Thanks everyone! I've
tried to respect all of the feedback, but some of it has been
contradictory and I haven't been able to incorporate everything.

Please speak up if I missed something important here.

Changes from v2:
 * Mention testing (Shuah)
 * Remove "very", rename LLM => coding assistant (Dan)
 * More formatting sprucing up and minor typos (Miguel)
 * Make changelog and text less flashy (Christian)
 * Tone down critical=>helpful (Neil)
 * Wording/formatting tweaks (Randy)

Changes from v1:
 * Rename to generated-content.rst and add to documentation index.
   (Jon)
 * Rework subject to align with the new filename
 * Replace commercial names with generic ones. (Jon)
 * Be consistent about punctuation at the end of bullets for whole
   sentences. (Miguel)
 * Formatting sprucing up and minor typos (Miguel)

This document was a collaborative effort from all the members of
the TAB. I just reformatted it into .rst and wrote the changelog.
---
 Documentation/process/generated-content.rst | 97 +++++++++++++++++++++
 Documentation/process/index.rst             |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 Documentation/process/generated-content.rst

diff --git a/Documentation/process/generated-content.rst b/Documentation/process/generated-content.rst
new file mode 100644
index 000000000000..917d6e93c66d
--- /dev/null
+++ b/Documentation/process/generated-content.rst
@@ -0,0 +1,97 @@
+============================================
+Kernel Guidelines for Tool-Generated Content
+============================================
+
+Purpose
+=======
+
+Kernel contributors have been using tooling to generate contributions
+for a long time. These tools can increase the volume of contributions.
+At the same time, reviewer and maintainer bandwidth is a scarce
+resource. Understanding which portions of a contribution come from
+humans versus tools is helpful to maintain those resources and keep
+kernel development healthy.
+
+The goal here is to clarify community expectations around tools. This
+lets everyone become more productive while also maintaining high
+degrees of trust between submitters and reviewers.
+
+Out of Scope
+============
+
+These guidelines do not apply to tools that make trivial tweaks to
+preexisting content. Nor do they pertain to AI tooling that helps with
+menial tasks. Some examples:
+
+ - Spelling and grammar fix ups, like rephrasing to imperative voice
+ - Typing aids like identifier completion, common boilerplate or
+   trivial pattern completion
+ - Purely mechanical transformations like variable renaming
+ - Reformatting, like running Lindent, ``clang-format`` or
+   ``rust-fmt``
+
+Even if your tool use is out of scope, you should still always consider
+if it would help reviewing your contribution if the reviewer knows
+about the tool that you used.
+
+In Scope
+========
+
+These guidelines apply when a meaningful amount of content in a kernel
+contribution was not written by a person in the Signed-off-by chain,
+but was instead created by a tool.
+
+Detection of a problem and testing the fix for it is also part of the
+development process; if a tool was used to find a problem addressed by
+a change, that should be noted in the changelog. This not only gives
+credit where it is due, it also helps fellow developers find out about
+these tools.
+
+Some examples:
+ - Any tool-suggested fix such as ``checkpatch.pl --fix``
+ - Coccinelle scripts
+ - A chatbot generated a new function in your patch to sort list entries.
+ - A .c file in the patch was originally generated by a coding
+   assistant but cleaned up by hand.
+ - The changelog was generated by handing the patch to a generative AI
+   tool and asking it to write the changelog.
+ - The changelog was translated from another language.
+
+If in doubt, choose transparency and assume these guidelines apply to
+your contribution.
+
+Guidelines
+==========
+
+First, read the Developer's Certificate of Origin:
+Documentation/process/submitting-patches.rst. Its rules are simple
+and have been in place for a long time. They have covered many
+tool-generated contributions. Ensure that you understand your entire
+submission and are prepared to respond to review comments.
+
+Second, when making a contribution, be transparent about the origin of
+content in cover letters and changelogs. You can be more transparent
+by adding information like this:
+
+ - What tools were used?
+ - The input to the tools you used, like the Coccinelle source script.
+ - If code was largely generated from a single or short set of
+   prompts, include those prompts. For longer sessions, include a
+   summary of the prompts and the nature of resulting assistance.
+ - Which portions of the content were affected by that tool?
+ - How is the submission tested and what tools were used to test the
+   fix?
+
+As with all contributions, individual maintainers have discretion to
+choose how they handle the contribution. For example, they might:
+
+ - Treat it just like any other contribution.
+ - Reject it outright.
+ - Treat the contribution specially like reviewing with extra scrutiny,
+   or at a lower priority than human-generated content.
+ - Suggest a better prompt instead of suggesting specific code changes.
+ - Ask for some other special steps, like asking the contributor to
+   elaborate on how the tool or model was trained.
+ - Ask the submitter to explain in more detail about the contribution
+   so that the maintainer can feel comfortable that the submitter fully
+   understands how the code works.
diff --git a/Documentation/process/index.rst b/Documentation/process/index.rst
index aa12f2660194..e1a8a31389f5 100644
--- a/Documentation/process/index.rst
+++ b/Documentation/process/index.rst
@@ -68,6 +68,7 @@ beyond).
    stable-kernel-rules
    management-style
    researcher-guidelines
+   generated-content
 
 Dealing with bugs
 -----------------
-- 
2.34.1

