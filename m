Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCD8379989;
	Sat,  9 May 2026 09:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778320141; cv=none; b=iCJR+q4jCzVTDlmMJxSHsVfEO3fW8NJ31GutjAAxNoLGRrdq+6YSwxpiesWJtHNBZ3l/EAUWxfrlNK9JekalZurJqM7Dt+heB57YcnAudryk7mfaTK+OuO+9iY4IEW8GhCR4W2DQrYf1rgn81ytevs4cQBqzlbzwkOQka0QmQQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778320141; c=relaxed/simple;
	bh=83fqebKEfKr0kM2Ofi4jNsb63LS/xzfGGZK6TJ26oEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lx/CEFgdNUyRynviNzGBmtmdNyc58/PL5S1Q5xmmd3qRcV0IX9damlMvGZKtRlpKndV408XrKjXV2Ha5SiIyAzh1k+yV1mwaLVYt9IrylilCeS6DtgCUdy5k7Lz17genfqLfbsLOx/7X+NVAnVAQ0itFLq4sOJ3iaB/BMxDEbqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=TbWOAiF4; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="TbWOAiF4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1778320137; bh=em2Rwq13kbGI0hii+Mft0rDixy2Egs4h+4Nv9nE8Zos=;
	h=From:Message-ID:From;
	b=TbWOAiF49g7j1cdBavPIoGH+oaZ9TTNqciO0PDviIadPogCVrnwyKVAJc9mvc6xpb
	 KvnmTGhX9HIFEZpR4YnNQ6eJHFnsgG3qz051+2xcMQhMF7t/bawDuZA0TDK4CQ7rl6
	 w10dNd7zq7WH4K2HYnOaI42CqNgV8hQeNKmp/pws=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 88F6FC0A83;
	Sat, 09 May 2026 11:48:57 +0200 (CEST)
From: Willy Tarreau <w@1wt.eu>
To: greg@kroah.com
Cc: Leon Romanovsky <leon@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        skhan@linuxfoundation.org, security@kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>,
        Greg KH <gregkh@linuxfoundation.org>
Subject: [PATCH v3 2/3] Documentation: security-bugs: explain what is and is not a security bug
Date: Sat,  9 May 2026 11:47:54 +0200
Message-ID: <20260509094755.2838-3-w@1wt.eu>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260509094755.2838-1-w@1wt.eu>
References: <20260509094755.2838-1-w@1wt.eu>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The use of automated tools to find bugs in random locations of the kernel
induces a raise of security reports even if most of them should just be
reported as regular bugs. This patch is an attempt at drawing a line
between what qualifies as a security bug and what does not, hoping to
improve the situation and ease decision on the reporter's side.

It defers the enumeration to a new file, threat-model.rst, that tries
to enumerate various classes of issues that are and are not security
bugs. This should permit to more easily update this file for various
subsystem-specific rules without having to revisit the security bug
reporting guide.

Cc: Greg KH <gregkh@linuxfoundation.org>
Cc: Leon Romanovsky <leon@kernel.org>
Suggested-by: Leon Romanovsky <leon@kernel.org>
Suggested-by: Greg KH <gregkh@linuxfoundation.org>
Reviewed-by: Leon Romanovsky <leon@kernel.org>
Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 Documentation/process/index.rst         |   1 +
 Documentation/process/security-bugs.rst |  38 +++-
 Documentation/process/threat-model.rst  | 236 ++++++++++++++++++++++++
 3 files changed, 274 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/process/threat-model.rst

diff --git a/Documentation/process/index.rst b/Documentation/process/index.rst
index dbd6ea16aca70..aa7c959a52b87 100644
--- a/Documentation/process/index.rst
+++ b/Documentation/process/index.rst
@@ -86,6 +86,7 @@ regressions and security problems.
    debugging/index
    handling-regressions
    security-bugs
+   threat-model
    cve
    embargoed-hardware-issues
 
diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
index 6dc525858125e..54260dbfc64d5 100644
--- a/Documentation/process/security-bugs.rst
+++ b/Documentation/process/security-bugs.rst
@@ -66,6 +66,42 @@ In addition, the following information are highly desirable:
     the issue appear. It is useful to share them, as they can be helpful to
     keep end users protected during the time it takes them to apply the fix.
 
+What qualifies as a security bug
+--------------------------------
+
+It is important that most bugs are handled publicly so as to involve the widest
+possible audience and find the best solution.  By nature, bugs that are handled
+in closed discussions between a small set of participants are less likely to
+produce the best possible fix (e.g., risk of missing valid use cases, limited
+testing abilities).
+
+It turns out that the majority of the bugs reported via the security team are
+just regular bugs that have been improperly qualified as security bugs due to
+a lack of awareness of the Linux kernel's threat model, as described in
+Documentation/process/threat-model.rst, and ought to have been sent through
+the normal channels described in Documentation/admin-guide/reporting-issues.rst
+instead.
+
+The security list exists for urgent bugs that grant an attacker a capability
+they are not supposed to have on a correctly configured production system, and
+can be easily exploited, representing an imminent threat to many users.  Before
+reporting, consider whether the issue actually crosses a trust boundary on such
+a system.
+
+**If you resorted to AI assistance to identify a bug, you must treat it as
+public**. While you may have valid reasons to believe it is not, the security
+team's experience shows that bugs discovered this way systematically surface
+simultaneously across multiple researchers, often on the same day. In this
+case, do not publicly share a reproducer, as this could cause unintended harm;
+just mention that one is available and maintainers might ask for it privately
+if they need it.
+
+If you are unsure whether an issue qualifies, err on the side of reporting
+privately: the security team would rather triage a borderline report than miss
+a real vulnerability.  Reporting ordinary bugs to the security list, however,
+does not make them move faster and consumes triage capacity that other reports
+need.
+
 Identifying contacts
 --------------------
 
@@ -74,7 +110,7 @@ affected subsystem's maintainers and Cc: the Linux kernel security team.  Do
 not send it to a public list at this stage, unless you have good reasons to
 consider the issue as being public or trivial to discover (e.g. result of a
 widely available automated vulnerability scanning tool that can be repeated by
-anyone).
+anyone, or use of AI-based tools).
 
 If you're sending a report for issues affecting multiple parts in the kernel,
 even if they're fairly similar issues, please send individual messages (think
diff --git a/Documentation/process/threat-model.rst b/Documentation/process/threat-model.rst
new file mode 100644
index 0000000000000..ecb432390e792
--- /dev/null
+++ b/Documentation/process/threat-model.rst
@@ -0,0 +1,236 @@
+.. _threatmodel:
+
+The Linux Kernel threat model
+=============================
+
+There are a lot of assumptions regarding what the kernel does and does not
+protect against. These assumptions tend to cause confusion for bug reports
+(:doc:`security-related ones <security-bugs>` vs :doc:`non-security ones
+<../admin-guide/reporting-issues>`), and can complicate security enforcement
+when the responsibilities for some boundaries is not clear between the kernel,
+distros, administrators and users.
+
+This document tries to clarify the responsibilities of the kernel in this
+domain.
+
+The kernel's responsibilities
+-----------------------------
+
+The kernel abstracts access to local hardware resources and to remote systems
+in a way that allows multiple local users to get a fair share of the available
+resources granted to them, and, when the underlying hardware permits, to assign
+a level of confidentiality to their communications and to the data they are
+processing or storing.
+
+The kernel assumes that the underlying hardware behaves according to its
+specifications. This includes the integrity of the CPU's instruction set, the
+transparency of the branch prediction unit and the cache units, the consistency
+of the Memory Management Unit (MMU), the isolation of DMA-capable peripherals
+(e.g., via IOMMU), state transitions in controllers, ranges of values read from
+registers, the respect of documented hardware limitations, etc.
+
+When hardware fails to maintain its specified isolation (e.g., CPU bugs,
+side-channels, hardware response to unexpected inputs), the kernel will usually
+attempt to implement reasonable mitigations. These are best-effort measures
+intended to reduce the attack surface or elevate the cost of an attack within
+the limits of the hardware's facilities; they do not constitute a
+kernel-provided safety guarantee.
+
+Users always perform their activities under the authority of an administrator
+who is able to grant or deny various types of permissions that may affect how
+users benefit from available resources, or the level of confidentiality of
+their activities. Administrators may also delegate all or part of their own
+permissions to some users, particularly via capabilities but not only. All this
+is performed via configuration (sysctl, file-system permissions etc).
+
+The Linux Kernel applies a certain collection of default settings that match
+its threat model. Distros have their own threat model and will come with their
+own configuration presets, that the administrator may have to adjust to better
+suit their expectations (relax or restrict).
+
+By default, the Linux Kernel guarantees the following protections when running
+on common processors featuring privilege levels and memory management units:
+
+* **User-based isolation**: an unprivileged user may restrict access to their
+  own data from other unprivileged users running on the same system. This
+  includes:
+
+  * stored data, via file system permissions
+  * in-memory data (pages are not accessible by default to other users)
+  * process activity (ptrace is not permitted to other users)
+  * inter-process communication (other users may not observe data exchanged via
+    UNIX domain sockets or other IPC mechanisms).
+  * network communications within the same or with other systems
+
+* **Capability-based protection**:
+
+  * users not having the ``CAP_SYS_ADMIN`` capability may not alter the
+    kernel's configuration, memory nor state, change other users' view of the
+    file system layout, grant any user capabilities they do not have, nor
+    affect the system's availability (shutdown, reboot, panic, hang, or making
+    the system unresponsive via unbounded resource exhaustion).
+  * users not having the ``CAP_NET_ADMIN`` capability may not alter the network
+    configuration, intercept nor spoof network communications from other users
+    nor systems.
+  * users not having ``CAP_SYS_PTRACE`` may not observe other users' processes
+    activities.
+
+When ``CONFIG_USER_NS`` is set, the kernel also permits unprivileged users to
+create their own user namespace in which they have all capabilities, but with a
+number of restrictions (they may not perform actions that have impacts on the
+initial user namespace, such as changing time, loading modules or mounting
+block devices). Please refer to ``user_namespaces(7)`` for more details, the
+possibilities of user namespaces are not covered in this document.
+
+The kernel also offers a lot of troubleshooting and debugging facilities, which
+can constitute attack vectors when placed in wrong hands. While some of them
+are designed to be accessible to regular local users with a low risk (e.g.
+kernel logs via ``/proc/kmsg``), some would expose enough information to
+represent a risk in most places and the decision to expose them is under the
+administrator's responsibility (perf events, traces), and others are not
+designed to be accessed by non-privileged users (e.g. debugfs). Access to these
+facilities by a user who has been explicitly granted permission by an
+administrator does not constitute a security breach.
+
+Bugs that permit to violate the principles above constitute security breaches.
+However, bugs that permit one violation only once another one was already
+achieved are only weaknesses. The kernel applies a number of self-protection
+measures whose purpose is to avoid crossing a security boundary when certain
+classes of bugs are found, but a failure of these extra protections do not
+constitute a vulnerability alone.
+
+What does not constitute a security bug
+---------------------------------------
+
+In the Linux kernel's threat model, the following classes of problems are
+**NOT** considered as Linux Kernel security bugs. However, when it is believed
+that the kernel could do better, they should be reported, so that they can be
+reviewed and fixed where reasonably possible, but they will be handled as any
+regular bug:
+
+* **Configuration**:
+
+  * outdated kernels and particularly end-of-life branches are out of the scope
+    of the kernel's threat model: administrators are responsible for keeping
+    their system up to date. For a bug to qualify as a security bug, it must be
+    demonstrated that it affects actively maintained versions.
+
+  * build-level: changes to the kernel configuration that are explicitly
+    documented as lowering the security level (e.g. ``CONFIG_NOMMU``), or
+    targeted at developers only.
+
+  * OS-level: changes to command line parameters, sysctls, filesystem
+    permissions, user capabilities, exposure of privileged interfaces, that
+    explicitly increase exposure by either offering non-default access to
+    unprivileged users, or reduce the kernel's ability to enforce some
+    protections or mitigations. Example: write access to procfs or debugfs.
+
+  * issues triggered only when using features intended for development or
+    debugging (e.g., LOCKDEP, KASAN, FAULT_INJECTION): these features are known
+    to introduce overhead and potential instability and are not intended for
+    production use.
+
+  * issues affecting drivers exposed under CONFIG_STAGING, as well as features
+    marked EXPERIMENTAL in the configuration.
+
+  * loading of explicitly insecure/broken/staging modules, and generally any
+    using any subsystem marked as experimental or not intended for production
+    use.
+
+  * running out-of-tree modules or unofficial kernel forks; these should be
+    reported to the relevant vendor.
+
+* **Excess of initial privileges**:
+
+  * actions performed by a user already possessing the privileges required to
+    perform that action or modify that state (e.g. ``CAP_SYS_ADMIN``,
+    ``CAP_NET_ADMIN``, ``CAP_SYS_RAWIO``, ``CAP_SYS_MODULE`` with no further
+    boundary being crossed).
+
+  * actions performed in user namespace that do not bypass the restrictions
+    imposed to the initial user (e.g. ptrace usage, signal delivery, resource
+    usage, access to FS/device/sysctl/memory, network binding, system/network
+    configuration etc).
+
+  * anything performed by the root user in the initial namespace (e.g. kernel
+    oops when writing to a privileged device).
+
+* **Out of production use**:
+
+  This covers theoretical/probabilistic attacks that rely on laboratory
+  conditions with zero system noise, or those requiring an unrealistic number
+  of attempts (e.g., billions of trials) that would be detected by standard
+  system monitoring long before success, such as:
+
+  * prediction of random numbers that only works in a totally silent
+    environment (such as IP ID, TCP ports or sequence numbers that can only be
+    guessed in a lab).
+
+  * activity observation and information leaks based on probabilistic
+    approaches that are prone to measurement noise and not realistically
+    reproducible on a production system.
+
+  * issues that can only be triggered by heavy attacks (e.g. brute force) whose
+    impact on the system makes it unlikely or impossible to remain undetected
+    before they succeed (e.g. consuming all memory before succeeding).
+
+  * problems seen only under development simulators, emulators, or combinations
+    that do not exist on real systems at the time of reporting (issues
+    involving tens of millions of threads, tens of thousands of CPUs,
+    unrealistic CPU frequencies, RAM sizes or disk capacities, network speeds.
+
+  * issues whose reproduction requires hardware modification or emulation,
+    including fake USB devices that pretend to be another one.
+
+  * as well as issues that can be triggered at a cost that is orders of
+    magnitude higher than the expected benefits (e.g. fully functional keyboard
+    emulator only to retrieve 7 uninitialized bytes in a structure, or
+    brute-force method involving millions of connection attempts to guess a
+    port number).
+
+* **Hardening failures**:
+
+  * ability to bypass some of the kernel's hardening measures with no
+    demonstrable exploit path (e.g. ASLR bypass, events timing or probing with
+    no demonstrable consequence). These are just weaknesses, not
+    vulnerabilities.
+
+  * missing argument checks and failure to report certain errors with no
+    immediate consequence.
+
+* **Random information leaks**:
+
+  This concerns information leaks of small data parts that happen to be there
+  and that cannot be chosen by the attacker, or face access restrictions:
+
+  * structure padding reported by syscalls or other interfaces.
+
+  * identifiers, partial data, non-terminated strings reported in error
+    messages.
+
+  * Leaks of kernel memory addresses/pointers do not constitute an immediately
+    exploitable vector and are not security bugs, though they must be reported
+    and fixed.
+
+* **Crafted file system images**:
+
+  * bugs triggered by mounting a corrupted or maliciously crafted file system
+    image are generally not security bugs, as the kernel assumes the underlying
+    storage media is under the administrator's control, unless the filesystem
+    driver is specifically documented as being hardened against untrusted media.
+
+  * issues that are resolved, mitigated, or detected by running a filesystem
+    consistency check (fsck) on the image prior to mounting.
+
+* **Physical access**:
+
+  Issues that require physical access to the machine, hardware modification, or
+  the use of specialized hardware (e.g., logic analyzers, DMA-attack tools over
+  PCI-E/Thunderbolt) are out of scope unless the system is explicitly
+  configured with technologies meant to defend against such attacks
+  (e.g. IOMMU).
+
+* **Functional and performance regressions**:
+
+  Any issue that can be mitigated by setting proper permissions and limits
+  doesn't qualify as a security bug.
-- 
2.52.0

