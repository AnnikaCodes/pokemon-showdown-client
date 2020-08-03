<?php

include_once __DIR__ . '/../config/config.inc.php';

class PSDatabase {
	var $db = null;

	var $server = null;
	var $username = null;
	var $password = null;
	var $database = null;
	var $charset = null;

	function __construct($dbconfig) {
		$this->server = $dbconfig['server'];
		$this->username = $dbconfig['username'];
		$this->password = $dbconfig['password'];
		$this->database = $dbconfig['database'];
		$this->charset = $dbconfig['charset'];
	}

	function connect() {
		if (!$this->db) {
			$arguments = "pgsql:host={$this->server};port=5432;";
			$arguments .= "dbname={$this->database};";
			$arguments .= "user={$this->username};";
			$arguments .= "password={$this->password}";
			$this->db = new PDO($arguments);
			$this->db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
		}
	}
	function query($query, $params=false) {
		$this->connect();
		if ($params) {
			$stmt = $this->db->prepare($query);
			$execution_result = $stmt->execute($params);
			if (!$execution_result) {
				return null;
			}
			return $stmt;
		} else {
			return $this->db->query($query);
		}
	}
	function fetch_assoc($resource) {
		return $resource->fetch(PDO::FETCH_ASSOC);
	}
	function fetch($resource) {
		return $resource->fetch();
	}
	function error() {
		if ($this->db) {
			return $this->db->errorInfo()[2];
		}
	}
	function insert_id() {
		if ($this->db) {
			return $this->db->lastInsertId();
		}
	}
}

$psdb = new PSDatabase($psconfig);
