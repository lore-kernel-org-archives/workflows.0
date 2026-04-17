Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595803932F0
	for <workflows@vger.kernel.org>; Fri, 17 Apr 2026 17:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776447402; cv=none; b=nUyZ4/HepeTOwg529pGvVkLLeo3XpPxGWF25L5ahOR5I0j50M2RMLngZTUuuUglsQ3cfLVw9SHNjKn8JAlwDZp8sQGwa35e2/K0yEdcwvrCp1bFZGLkUbVeaymuXWNsCVk/JFXL7PnpQqQjccCPRyfbkp1LSIXbJxBDiG4daYp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776447402; c=relaxed/simple;
	bh=jkTCGTx5N5kNDBuJiGd3cHBXCdOpLr+klCtenLR7CNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Vep5KMnLGOfjE4Xtg3CmgP9uYaIIyXOV4iJYTiblFpvod1UdwgjiD+Dq67MgSA3CSmXHsCd1Ss4i70SKjcGPFyo6JWkeF1Mz1gq7esFQBt5yIZQpu2wXPRUPBrjl4s1Hk89UnKGrkjF+1fCuyyVs3t6dGDh8goJyFj84tG0kit4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KcTGVCcd; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KcTGVCcd"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so6851835e9.1
        for <workflows@vger.kernel.org>; Fri, 17 Apr 2026 10:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776447395; x=1777052195; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+okOEmaZb2t8QpikbjQlDiBfQLIdyz/gfflHu8dorl0=;
        b=KcTGVCcdtlg3nw8BAgXzEsc5FtsAAMV3C7qKTPbllVc50bZPgkchNGpistzh5gFoNi
         k+fQBhoK1hETiEaGuqarRehzUU3T8k9Cu2b5725SE8rR+j2KlmMMbcqq+dE8kKANqNu2
         RZWUjDwrMJi3CCU+4Y0WT1M2qNMQrixKQQFS7i2Y1xuNBjVgewOOg2faStB3xShBG05R
         bu79LnwQQXGt7anMWRDn8MVXpedXkALUUEEzWPzSjQd4Yomhveih+/Wn1LBXIHVECf7J
         XHtVPERW4BOLcKuJjFe/Mx3GQTlFDVC98BrCfZ+qqYmg84Yf9xQTkkroz+/q5ExUht63
         MCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776447395; x=1777052195;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+okOEmaZb2t8QpikbjQlDiBfQLIdyz/gfflHu8dorl0=;
        b=labnjVwK543mdUPkYO8ED7Ugcw8UBHg8FHXvAoejSYf903TT+nUPlQJW/oCR1s6LV1
         rw3jjti0EgwHgmuWqMgDcnblBeze0PUo+XPEOgfEcnUom6H73WLA9H7N4kx+MXCky4+b
         zJ2z68bTovTYWg1DBtMJ6iY83lAevsaa3dIIEdnMeoJj9xCtm5SUUDp2sY9HPO8GJ8ad
         yu/da8Q1uzjdOcF5zghcI2Taeru4cM+zhm7qw2TXhOqcqrF8szPFGNUrpiGod+9Z/VTi
         zzc26dO/oqlY0cepaHTt4KdKZnpkT91P6GCy99ZFB1E4HCZPYGCtpc+94WUanrXRTrPX
         CrMQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ncWf8Xi6KnxSc2ALqsgsb9VsoAMzce3HJymYpdQZjnSauVwHb4EoukTXS/5StVdswX/xwauLQbYA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6ab2a9S/ufdUdPpmkVcMqNLeODm3H+9izaR7Nx3BlD5lFGtzh
	IRdyaXgH3BTBoHQJd4vsMl6aUeu3pLgTACkhKj/V7kA8uhkbXnN0LY9f8ZZmk/epkGw=
X-Gm-Gg: AeBDiesnUcFfWzvUUruo4OrBmZ7RqxLxC0Pd4MjT/H7nKgqeI81KRn3bS70vom2Om6k
	NE1JPNpD9x7fkUD69TiWGYZdCWMP9sdlQQW0di68vIjRwO2le78N//snwgYE0TnNOsV8TiqfPVc
	JFLLM4FPZGRghhkaRR7IDD7r+qKPzeFiOZfbab2ZSJiHmGV4+2yX7ngSreL66sJJvGYzVKeNANy
	bau97rNMeVtN4eoddepDekVS0bL5mL+ZlFcKVfRvX/Ee4sJe3JvJ8LwLSn7bcOp4KcdgJKav3Bk
	RduZmf+NHzEgpR3YMGEyk0zZB6jbYgfmhigKiAOHMA5XX73vfG5WpIk0Foh24eLiU1peiONgStK
	0C69UEf0lqdNa3ZYCr06G7+gxiPSDcsdZTGfSg8I+fQUeRxIpe1b8a1jh2qt6Sq7TsjMbYbQlH0
	l6kvBEJLWDo6BWgeCERaxhW7c=
X-Received: by 2002:a05:600c:888b:b0:488:c40b:c8bf with SMTP id 5b1f17b1804b1-488fb73d234mr44822655e9.2.1776447395380;
        Fri, 17 Apr 2026 10:36:35 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:dc8:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm3917884eec.8.2026.04.17.10.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 10:36:34 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 17 Apr 2026 14:36:28 -0300
Subject: [PATCH] docs: kselftest: Document the FORCE_TARGETS build variable
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260417-selftests-docs-v1-1-32e4a78214eb@suse.com>
X-B4-Tracking: v=1; b=H4sIAJtv4mkC/yWMQQ7CIBREr9L8tURKGo1exbj4wCAYQw2fmiZN7
 y7o8k3mvY0EJUHoOmxU8EmS5txgPAzkIucHVPKNyWhz0tN4VoJXqJAqys9OVPBhwsUY9kZTk94
 FIa2/4O3+Z1nsE672Sn9YFihbOLvYJ4kLx2PGWmnfv4g8gcKPAAAA
X-Change-ID: 20260417-selftests-docs-fdf4e922ad20
To: Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org, 
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1776447391; l=1836;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=jkTCGTx5N5kNDBuJiGd3cHBXCdOpLr+klCtenLR7CNE=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGCdk+Dqytqm1mJBSK4cT3p4LBx+mdWpB8pQc8eyh2BrVstLyrEfAJ2T/V17tilHX0CXhRx/m1D
 RzaCl4kQSDw8=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

FORCE_TARGETS has been part of the kselftest build system for
some time but is absent from the developer documentation. Without
an entry here, users relying on kselftest in CI pipelines would
have to read the selftests Makefile directly to discover the
option.

A build that exits zero despite some targets failing can mask
real breakage and mislead automated systems into reporting
success. Add a dedicated section so that CI authors can easily
find and adopt FORCE_TARGETS=1 to turn such silent partial
failures into hard errors.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 Documentation/dev-tools/kselftest.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
index 18c2da67fae4..d7bfe320338c 100644
--- a/Documentation/dev-tools/kselftest.rst
+++ b/Documentation/dev-tools/kselftest.rst
@@ -126,6 +126,18 @@ dedicated skiplist::
 See the top-level tools/testing/selftests/Makefile for the list of all
 possible targets.
 
+Requiring all targets to build successfully
+===========================================
+
+By default, the build succeeds as long as at least one target builds
+without error. Set ``FORCE_TARGETS=1`` to instead require every target to
+build successfully; make will abort as soon as any target fails::
+
+  $ make -C tools/testing/selftests FORCE_TARGETS=1
+
+This applies to both the ``all`` and ``install`` targets and is useful in
+CI environments where a silent partial build would be misleading.
+
 Running the full range hotplug selftests
 ========================================
 

---
base-commit: 83ef26f911432d9c98b6d8b6ed0709a8b79cd834
change-id: 20260417-selftests-docs-fdf4e922ad20

Best regards,
--  
Ricardo B. Marlière <rbm@suse.com>

